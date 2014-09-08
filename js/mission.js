$(function(){
	var grid = $('#grid');
	var settings = {
	  	source: 'mission', //name of table, view or the actual sql that you wish to display in the grid
  		item_name: 'משימה',
		load_edit_record: true, //reload record before editting
		template: {
			use: true,
			columns: 3
		},
		filterToolbar:{
			hide: false,
			navButtonAdd: false,
			options: {
				searchOperators: true,
				searchOnEnter: false,
				stringResult: true,
				defaultSearch: 'cn',
				beforeSearch: function(){
					var $t = $(this);
					var postData = $t.jqGrid('getGridParam','postData');
				}
			}
		},
		'export':{
			options: {
				title: 'ייצא לאקסל'
			},
			associative:'both'
		},
		copy:{
			properties: {
				editCaption: 'העתק רשומה'
			},
			options: {
				title: 'העתק שורה מסומנת'
			},
			showFormInit: function(formid, source_id){
				var grid = $.jset.fn.get_grid_by_formid(formid);
				$($.jset.fn.get_form_field(formid, 'created_on')).val('');
			}
		},
		help:{
			hide: false,
			navButtonAdd: true,
			dialog: {
				autoOpen: false,
				title: 'הסבר',
				width: 600,
				position: 'top'
			},
			options: {
				caption:'',
				title:'הסבר', 
				buttonicon :'ui-icon-lightbulb', 
				position: 'last'
			}
		},
		columnChooser:{
			navButtonAdd: true,
			options: {
				caption: '',
				title: 'בחר עמודות',
				buttonicon: 'ui-icon-calculator',
				position: 'last'
			   /* dialog_opts: {
			        modal: true,
			        minWidth: 470,
			        minHeight: 370,
			        show: 'blind',
			        hide: 'explode'
			    }*/
			},
			multiselect:{
			    locale: {
			        addAll: 'הצג את כל העמודות',
			        removeAll: 'הסתר את כל העמודות',
			        itemsCount: 'עמודות מוצגות'
			    }
			},
			col:{
			    width: 420,
			    //modal: true,
			    msel_opts: {dividerLocation: 0.5},
			    dialog_opts: {
			        minWidth: 470,
			        minHeight: 370,
			        show: 'blind',
			        hide: 'explode'
			    }
			}
		},
		beforeShowForm: function(formid){
			var grid = $.jset.fn.get_grid_by_formid(formid);
			if(grid.data('form_action') == 'add' || grid.data('form_action') == 'copy')
			{
				$.jset.fn.get_rows(grid, 
					'select max(cast(name as signed)) + 1 as next_number from mission',
					function(data){
						$($.jset.fn.get_form_field(formid, 'name')).val(data.length ? data[0].next_number : '');
				});
			}
		},
	    grid: {
	    		direction: 'rtl',
			autowidth: true,
			sortname: 'created_on',
			sortorder: 'desc',
			footerrow : true,
			userDataOnFooter : true,
			height: $(window).height() - 140
	  	},
	  	navigation:{
			options : {
				search: false,
				view: false
			},
			edit:{
			},
			add:{
			},
			del:{
			},
			search:{
				//
			},
			view:{
			}
		}

	};
	
	grid.jset($.extend(true, settings, $.jset.fn.url_filters()));
});