(function($) {
    $.fn.createScrollableTable = function(options) {

        var defaults = {
            width: '100%',
            height: '300px',
            border: 'none',
            formatBufferCol: false
        };
        var options = $.extend(defaults, options);

        return this.each(function() {
            var table = $(this);
            prepareTable(table);
        });

        function prepareTable(table) {
            var tableId = table.attr('id') || options.id || 'scrolltable'

            // If the amount of columns varies then an invisible first row will need to be inserted in
            // the header table so that the widths can be set
            var tableInfo = tableColumnsVary(table);
            if (tableInfo.varying) {
                var firstRow = $(document.createElement('tr')).css({height: 0, overflow: 'hidden'});
                for(i = 0; i < tableInfo.cols; i++) {
                    firstRow.append(
                        $(document.createElement('th'))
                            .css({
                                background: 'transparent',
                                height: '0px',
                                overflow: 'hidden',
                                margin: 0,
                                padding: 0,
                                'line-height': '0px',
                                'font-size': '0px',
                            })
                            .attr('height', 0)
                    );
                }
            }


            // wrap the current table (will end up being just body table)
            var bodyWrap = table.wrap('<div></div>')
                .parent()
                .attr('id', tableId + '_body_wrap')
                .css({
                    width: '100%',
                    height: options.height,
                    overflow: 'auto',
                });

            // wrap the body
            var tableWrap = bodyWrap.wrap('<div></div>')
                .parent()
                .attr('id', tableId + '_table_wrap')
                .css({
                    width: '100%',
                    overflow: 'hidden',
                    display: 'inline-block',
                    border: options.border
                });

            // clone the header
            var headWrap = $(document.createElement('div'))
                .attr('Id', tableId + '_head_wrap')
                .prependTo(tableWrap)
                .css({
                    width: '100%',
                    overflow: 'hidden'
                });

            var headTable = table.clone(true)
                .attr('Id', tableId + '_head')
                .appendTo(headWrap)
                .css({
                    height: table.find('thead').height(),
                    'table-layout': 'fixed'
                })

            if (tableInfo.varying) {
                firstRow.prependTo(headTable.find('thead'));
            }


            var bufferCol = $(document.createElement('th'))
                .css({
                    'background': 'transparent',
                    'border': 0,
                    'width:': '100%'
                })
                .attr('width', '100%' + 'px')
                .appendTo(headTable.find('thead tr'));

            if (options.formatBufferCol) {
                $.each(bufferCol, function(i, el) {
                    //console.log($(col).css('background-color'));
                    var $el = $(el);
                    var $prevEl = $el.prev();
                    var cssProperties = {};
                    $.each([
                        'background', 'background-color', 'background-image',
                        'border-top', 'border-top-style', 'border-top-color', 'border-top-width',
                        'border-bottom', 'border-bottom-style', 'border-bottom-color', 'border-bottom-width'], function(j, cssProperty) {
                        cssProperties[cssProperty] = $prevEl.css(cssProperty);
                    });
                    $el.css(cssProperties);
                });
            }


            // remove the extra html
            headTable.find('tbody').remove();
            table.find('thead').remove();

            table.css({
                'border': 0
            });

            var sizeHeaders = function() {
                var allBodyCols = table.find('tbody tr:first td');
                // size the header columns to match the body
                var headers = headTable.find('thead tr th');
                headers.each(function(index) {
                    if (index < (headers.length -1)) {
                        var desiredWidth = getWidth($(allBodyCols[index]));
                        $(this).css({ width: desiredWidth + 'px' });
                    }
                });
            }

            sizeHeaders();
            $(window).resize(sizeHeaders);
        }

        function tableColumnsVary(table) {
            // return numbner of columns and if they vary over the table
            var cols = $(table).find('tr:first th').length;
            var prevCols = cols;
            var columnsChanged = false;

            $.each(table.find('tr'), function(index, row) {
                prevCols = cols;
                cols = Math.max(cols, $(row).find('th').length);
                columnsChanged |= (prevCols != cols);
            });
            return {
                'cols': cols,
                'varying': columnsChanged
            }
        }

        var allHeadCols = headTable.find('thead tr th');
        var total_cols = headTable.find('thead tr th').length;
        var cols = total_cols - headTable.find('.hidden').length;
        var bgcolor = $(allHeadCols[total_cols-2]).css('background-color');
        $(allHeadCols[total_cols-1]).css('background-color', bgcolor);
        headTable.find('thead tr th').each(function(index) {
        var desiredWidth = getWidth($(allBodyCols[index]),cols);
        $(this).css({ width: desiredWidth + 'px' });
        });

        function getWidth(td,cols) {
        if ($.browser.msie) { return $(td).outerWidth() - (22-cols); }
        if ($.browser.mozilla) { return $(td).outerWidth() - (22-cols); }
        if ($.browser.safari) { return $(td).outerWidth(); }
        if ($.browser.webkit) { return $(td).outerWidth() - 1; }
        return $(td).outerWidth();
        };

        return $.each()

    };

})(jQuery);
