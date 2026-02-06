/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "ani/ani.h"
#include <array>
#include <iostream>
#include "arkui/native_node_ani.h"
#include "hilog/log.h"
#include "common/common.h"
#include "lazyforeach/lazyforeach_create_test.cpp"
#include "lazyforeach/lazyforeach_setuserdata_test.cpp"
#include "lazyforeach/lazyforeach_unregistereventreceiver_test.cpp"
#include "lazyforeach/lazyforeach_gettotalnodecount_test.cpp"
#include "lazyforeach/lazyforeach_settotalnodecount_test.cpp"
#include "lazyforeach/lazyforeach_dispose_test.cpp"
#include "lazyforeach/lazyforeach_registereventreceiver_test.cpp"
#include "lazyforeach/lazyforeach_reloadallitems_test.cpp"
#include "lazyforeach/lazyforeach_test.h"
#include "lazyforeach/lazyforeach_reloaditem_test.cpp"
#include "lazyforeach/lazyforeach_removeitem_test.cpp"
#include "lazyforeach/lazyforeach_moveitem_test.cpp"
#include "lazyforeach/lazyforeach_insertitem_test.cpp"
#include "lazyforeach/lazyforeach_getallitems_test.cpp"
#include "lazyforeach/lazyforeach_getuserdata_test.cpp"
#include "lazyforeach/lazyforeach_gettype_test.cpp"
#include "lazyforeach/lazyforeach_getremovednode_test.cpp"
#include "lazyforeach/lazyforeach_getitemindex_test.cpp"
#include "lazyforeach/lazyforeach_gethostnode_test.cpp"
#include "lazyforeach/lazyforeach_setitem_test.cpp"
#include "lazyforeach/lazyforeach_setnodeid_test.cpp"
#include "datepicker/datepicker_lunar_test.cpp"
#include "datepicker/datepicker_width_test.cpp"
#include "button/button_fontsize_test.cpp"
#include "button/button_fontweight_test.cpp"
#include "button/button_backgroundcolor_test.cpp"
#include "button/button_onclick_test.h"
#include "button/button_label_test.h"
#include "button/button_fontcolor_test.cpp"
#include "button/button_type_test.cpp"
#include "checkbox/checkbox_onchange_test.h"
#include "checkbox/checkbox_enabled_test.h"
#include "checkbox/checkbox_mark_test.cpp"
#include "checkbox/checkbox_select_test.cpp"
#include "checkbox/checkbox_selectedcolor_test.cpp"
#include "checkbox/checkbox_shape_test.cpp"
#include "checkbox/checkbox_unselectedcolor_test.cpp"
#include "checkbox/checkbox_width_test.cpp"
#include "checkbox/checkbox_height_test.cpp"
#include "slider/slider_width_test.cpp"
#include "slider/slider_height_test.cpp"
#include "slider/slider_blockcolor_test.cpp"
#include "slider/slider_direction_test.cpp"
#include "slider/slider_max_test.cpp"
#include "slider/slider_min_test.cpp"
#include "slider/slider_reverse_test.cpp"
#include "slider/slider_selectedcolor_test.cpp"
#include "slider/slider_showsteps_test.cpp"
#include "slider/slider_step_test.cpp"
#include "slider/slider_style_test.cpp"
#include "slider/slider_trackcolor_test.cpp"
#include "slider/slider_trackthickness_test.cpp"
#include "slider/slider_value_test.cpp"
#include "slider/slider_enabled_test.h"
#include "slider/slider_color_test.h"
#include "slider/slider_onchange_test.h"
#include "loadingprogress/loadingprogress_color_test.cpp"
#include "loadingprogress/loadingprogress_enableloading_test.cpp"
#include "progress/progress_color_test.cpp"
#include "progress/progress_backgroundcolor_test.cpp"
#include "progress/progress_style_test.cpp"
#include "progress/progress_total_test.cpp"
#include "progress/progress_value_test.cpp"
#include "progress/progress_type_test.cpp"
#include "refresh/refresh_offsetEvent_test.h"
#include "refresh/refresh_onrefreshing_test.h"
#include "refresh/refresh_onstatechange_test.h"
#include "refresh/refresh_onOffsetChange_test.h"
#include "refresh/refresh_offset_test.cpp"
#include "refresh/refresh_pulldownratio_test.cpp"
#include "refresh/refresh_pulltorefresh_test.cpp"
#include "refresh/refresh_refreshing_test.cpp"
#include "refresh/refresh_content_test.cpp"
#include "accessibility/button_accessibilitydescription_test.cpp"
#include "accessibility/button_accessibilitygroup_test.cpp"
#include "accessibility/button_accessibilitylevel_test.cpp"
#include "accessibility/button_accessibilitytext_test.cpp"
#include "accessibility/checkbox_accessibilitydescription_test.cpp"
#include "accessibility/checkbox_accessibilitygroup_test.cpp"
#include "accessibility/checkbox_accessibilitylevel_test.cpp"
#include "accessibility/checkbox_accessibilitytext_test.cpp"
#include "accessibility/datepicker_accessibilitydescription_test.cpp"
#include "accessibility/datepicker_accessibilitygroup_test.cpp"
#include "accessibility/datepicker_accessibilitylevel_test.cpp"
#include "accessibility/datepicker_accessibilitytext_test.cpp"
#include "accessibility/list_accessibilitydescription_test.cpp"
#include "accessibility/list_accessibilitygroup_test.cpp"
#include "accessibility/list_accessibilitylevel_test.cpp"
#include "accessibility/list_accessibilitytext_test.cpp"
#include "accessibility/progress_accessibilitydescription_test.cpp"
#include "accessibility/progress_accessibilitygroup_test.cpp"
#include "accessibility/progress_accessibilitylevel_test.cpp"
#include "accessibility/progress_accessibilitytext_test.cpp"
#include "accessibility/refresh_accessibilitydescription_test.cpp"
#include "accessibility/refresh_accessibilitygroup_test.cpp"
#include "accessibility/refresh_accessibilitylevel_test.cpp"
#include "accessibility/refresh_accessibilitytext_test.cpp"
#include "accessibility/scroll_accessibilitydescription_test.cpp"
#include "accessibility/scroll_accessibilitygroup_test.cpp"
#include "accessibility/scroll_accessibilitylevel_test.cpp"
#include "accessibility/scroll_accessibilitytext_test.cpp"
#include "accessibility/slider_accessibilitydescription_test.cpp"
#include "accessibility/slider_accessibilitygroup_test.cpp"
#include "accessibility/slider_accessibilitylevel_test.cpp"
#include "accessibility/slider_accessibilitytext_test.cpp"
#include "accessibility/swiper_accessibilitydescription_test.cpp"
#include "accessibility/swiper_accessibilitygroup_test.cpp"
#include "accessibility/swiper_accessibilitylevel_test.cpp"
#include "accessibility/swiper_accessibilitytext_test.cpp"
#include "accessibility/text_accessibilitydescription_test.cpp"
#include "accessibility/text_accessibilitygroup_test.cpp"
#include "accessibility/text_accessibilitylevel_test.cpp"
#include "accessibility/text_accessibilitytext_test.cpp"
#include "accessibility/textarea_accessibilitydescription_test.cpp"
#include "accessibility/textarea_accessibilitygroup_test.cpp"
#include "accessibility/textarea_accessibilitylevel_test.cpp"
#include "accessibility/textarea_accessibilitytext_test.cpp"
#include "accessibility/textinput_accessibilitydescription_test.cpp"
#include "accessibility/textinput_accessibilitygroup_test.cpp"
#include "accessibility/textinput_accessibilitylevel_test.cpp"
#include "accessibility/textinput_accessibilitytext_test.cpp"
#include "accessibility/textpicker_accessibilitydescription_test.cpp"
#include "accessibility/textpicker_accessibilitygroup_test.cpp"
#include "accessibility/textpicker_accessibilitylevel_test.cpp"
#include "accessibility/textpicker_accessibilitytext_test.cpp"
#include "accessibility/timepicker_accessibilitydescription_test.cpp"
#include "accessibility/timepicker_accessibilitygroup_test.cpp"
#include "accessibility/timepicker_accessibilitylevel_test.cpp"
#include "accessibility/timepicker_accessibilitytext_test.cpp"
#include "accessibility/toggle_accessibilitydescription_test.cpp"
#include "accessibility/toggle_accessibilitygroup_test.cpp"
#include "accessibility/toggle_accessibilitylevel_test.cpp"
#include "accessibility/toggle_accessibilitytext_test.cpp"
#include "customcomponent/customcomponent_onmeasure_test.h"
#include "customcomponent/customcomponent_onlayout_test.h"
#include "customcomponent/customcomponent_ondraw_test.h"
#include "customcomponent/customcomponent_enabled_test.h"
#include "customcomponent/customcomponent_focusable_test.h"
#include "customcomponent/customcomponent_onappear_test.h"
#include "customcomponent/customcomponent_ontouch_test.h"
#include "customcomponent/customcomponent_onareachange_test.h"
#include "customcomponent/customcomponent_onblur_test.h"
#include "customcomponent/customcomponent_onfocus_test.h"
#include "customcomponent/customcomponent_onclick_test.h"
#include "customcomponent/customcomponent_hittestbehavior_test.h"
#include "customcomponent/customcomponent_id_test.h"
#include "customcomponent/customcomponent_event_test.h"
#include "customcomponent/customcomponent_measurenode_test.h"
#include "customcomponent/customcomponent_getcontextdrawcanvas_test.h"
#include "customcomponent/customcomponent_drawcontextgetsize_test.h"
#include "customcomponent/customcomponent_eventondraw_test.h"
#include "customcomponent/customcomponent_registernodecustomevent_test.h"
#include "customcomponent/customcomponent_unregisternodecustomevent_test.h"
#include "customcomponent/customcomponent_secondarylayout_test.h"
#include "customcomponent/customcomponent_accessibilitygroup_test.cpp"
#include "customcomponent/customcomponent_accessibilitylevel_test.cpp"
#include "customcomponent/customcomponent_align_test.cpp"
#include "customcomponent/customcomponent_alignself_test.cpp"
#include "customcomponent/customcomponent_backgroundcolor_test.cpp"
#include "customcomponent/customcomponent_blendmode_test.cpp"
#include "customcomponent/customcomponent_bordercolor_test.cpp"
#include "customcomponent/customcomponent_borderradius_test.cpp"
#include "customcomponent/customcomponent_borderstyle_test.cpp"
#include "customcomponent/customcomponent_borderwidth_test.cpp"
#include "customcomponent/customcomponent_constraintsize_test.cpp"
#include "customcomponent/customcomponent_contrast_test.cpp"
#include "customcomponent/customcomponent_direction_test.cpp"
#include "customcomponent/customcomponent_flexbasis_test.cpp"
#include "customcomponent/customcomponent_flexgrow_test.cpp"
#include "customcomponent/customcomponent_flexshrink_test.cpp"
#include "customcomponent/customcomponent_foregroundblurstyle_test.cpp"
#include "customcomponent/customcomponent_grayscale_test.cpp"
#include "customcomponent/customcomponent_height_test.cpp"
#include "customcomponent/customcomponent_invert_test.cpp"
#include "customcomponent/customcomponent_lineargradient_test.cpp"
#include "customcomponent/customcomponent_margin_test.cpp"
#include "customcomponent/customcomponent_opacity_test.cpp"
#include "customcomponent/customcomponent_position_test.cpp"
#include "customcomponent/customcomponent_radialgradient_test.cpp"
#include "customcomponent/customcomponent_scale_test.cpp"
#include "customcomponent/customcomponent_sepia_test.cpp"
#include "customcomponent/customcomponent_shadow_test.cpp"
#include "customcomponent/customcomponent_sweepgradient_test.cpp"
#include "customcomponent/customcomponent_transform_test.cpp"
#include "customcomponent/customcomponent_width_test.cpp"
#include "customcomponent/customcomponent_event_null_test.cpp"
#include "customcomponent/customcomponent_getchildtotalcount_test.cpp"
#include "customcomponent/customcomponent_getchildAt_test.cpp"
#include "customcomponent/customcomponent_getfirstchild_test.cpp"
#include "customcomponent/customcomponent_getlastchild_test.cpp"
#include "customcomponent/customcomponent_getprevioussibling_test.cpp"
#include "customcomponent/customcomponent_getnextsibling_test.cpp"
#include "customcomponent/customcomponent_measuredsize_test.cpp"
#include "customcomponent/customcomponent_layoutposition_test.cpp"
#include "customcomponent/customcomponent_layoutconstraintdispose_test.cpp"
#include "customcomponent/customcomponent_layoutconstraintcreate_test.cpp"
#include "customcomponent/customcomponent_layoutconstraint_test.cpp"
#include "customdialog/customdialog_test.h"
#include "customdialog/customdialog_alignment_test.cpp"
#include "customdialog/customdialog_close_test.cpp"
#include "customdialog/customdialog_customstyle_test.cpp"
#include "customdialog/customdialog_open_test.cpp"
#include "customdialog/customdialog_maskcolor_test.cpp"
#include "customdialog/customdialog_enablecustomanimation_test.cpp"
#include "customdialog/customdialog_registeronwilldismiss_test.cpp"
#include "customdialog/customdialog_removecontent_test.cpp"
#include "customdialog/customdialog_resetcontentalignment_test.cpp"
#include "customdialog/customdialog_setautocancel_test.cpp"
#include "customdialog/customdialog_setbackgroundcolor_test.cpp"
#include "customdialog/customdialog_setcontent_test.cpp"
#include "customdialog/customdialog_setcontentalignment_test.cpp"
#include "customdialog/customdialog_setcornerradius_test.cpp"
#include "customdialog/customdialog_setgridcolumncount_test.cpp"
#include "customdialog/customdialog_setmask_test.cpp"
#include "customdialog/customdialog_setmodalmode_test.cpp"
#include "customdialog/customdialog_show_test.cpp"
#include "commonattrs/commonattrs_accessibilityactions_test.cpp"
#include "commonattrs/commonattrs_accessibilityid_test.cpp"
#include "commonattrs/commonattrs_accessibilityrole_test.cpp"
#include "commonattrs/commonattrs_accessibilitystate_test.cpp"
#include "commonattrs/commonattrs_accessibilityvalue_test.cpp"
#include "commonattrs/commonattrs_align_test.cpp"
#include "commonattrs/commonattrs_aligncontent_test.cpp"
#include "commonattrs/commonattrs_alignitems_test.cpp"
#include "commonattrs/commonattrs_alignself_test.cpp"
#include "commonattrs/commonattrs_aspectratio_test.cpp"
#include "commonattrs/commonattrs_backgroundblurstyle_test.cpp"
#include "commonattrs/commonattrs_backgroundcolor_test.cpp"
#include "commonattrs/commonattrs_backgroundimagepixelmap_test.cpp"
#include "commonattrs/commonattrs_backgroundimageposition_test.cpp"
#include "commonattrs/commonattrs_backgroundimagesize_test.cpp"
#include "commonattrs/commonattrs_blendmode_test.cpp"
#include "commonattrs/commonattrs_blur_test.cpp"
#include "commonattrs/commonattrs_bordercolor_test.cpp"
#include "commonattrs/commonattrs_borderradius_test.cpp"
#include "commonattrs/commonattrs_borderstyle_test.cpp"
#include "commonattrs/commonattrs_borderwidth_test.cpp"
#include "commonattrs/commonattrs_brightness_test.cpp"
#include "commonattrs/commonattrs_chainmode_test.cpp"
#include "commonattrs/commonattrs_colorblend_test.cpp"
#include "commonattrs/commonattrs_constraintsize_test.cpp"
#include "commonattrs/commonattrs_contrast_test.cpp"
#include "commonattrs/commonattrs_customshadow_test.cpp"
#include "commonattrs/commonattrs_defaultfocus_test.cpp"
#include "commonattrs/commonattrs_direction_test.cpp"
#include "commonattrs/commonattrs_displaypriority_test.cpp"
#include "commonattrs/commonattrs_expandsafearea_test.cpp"
#include "commonattrs/commonattrs_flexbasis_test.cpp"
#include "commonattrs/commonattrs_flexgrow_test.cpp"
#include "commonattrs/commonattrs_flexshrink_test.cpp"
#include "commonattrs/commonattrs_focusontouchfunc_test.cpp"
#include "commonattrs/commonattrs_focusstatusfunc_test.cpp"
#include "commonattrs/commonattrs_foregroundblurstyle_test.cpp"
#include "commonattrs/commonattrs_foregroundcolor_test.cpp"
#include "commonattrs/commonattrs_grayscale_test.cpp"
#include "commonattrs/commonattrs_height_test.cpp"
#include "commonattrs/commonattrs_invert_test.cpp"
#include "commonattrs/commonattrs_justifycontent_test.cpp"
#include "commonattrs/commonattrs_layoutweight_test.cpp"
#include "commonattrs/commonattrs_lineargradient_test.cpp"
#include "commonattrs/commonattrs_margin_test.cpp"
#include "commonattrs/commonattrs_markanchor_test.cpp"
#include "commonattrs/commonattrs_offset_test.cpp"
#include "commonattrs/commonattrs_outlinecolor_test.cpp"
#include "commonattrs/commonattrs_outlinewidth_test.cpp"
#include "commonattrs/commonattrs_opacity_test.cpp"
#include "commonattrs/commonattrs_padding_test.cpp"
#include "commonattrs/commonattrs_position_test.cpp"
#include "commonattrs/commonattrs_radialgradient_test.cpp"
#include "commonattrs/commonattrs_renderfit_test.cpp"
#include "commonattrs/commonattrs_rendergroup_test.cpp"
#include "commonattrs/commonattrs_responseregion_test.cpp"
#include "commonattrs/commonattrs_rotate_test.cpp"
#include "commonattrs/commonattrs_saturate_test.cpp"
#include "commonattrs/commonattrs_scale_test.cpp"
#include "commonattrs/commonattrs_sepia_test.cpp"
#include "commonattrs/commonattrs_shadow_test.cpp"
#include "commonattrs/commonattrs_size_test.cpp"
#include "commonattrs/commonattrs_sweepgradient_test.cpp"
#include "commonattrs/commonattrs_touchablefunc_test.cpp"
#include "commonattrs/commonattrs_transform_test.cpp"
#include "commonattrs/commonattrs_transformcenter_test.cpp"
#include "commonattrs/commonattrs_transitionasymmetric_test.cpp"
#include "commonattrs/commonattrs_transitionmove_test.cpp"
#include "commonattrs/commonattrs_transitionopacity_test.cpp"
#include "commonattrs/commonattrs_transitionrotate_test.cpp"
#include "commonattrs/commonattrs_transitionscale_test.cpp"
#include "commonattrs/commonattrs_transitiontranslate_test.cpp"
#include "commonattrs/commonattrs_translate_test.cpp"
#include "commonattrs/commonattrs_visibility_test.cpp"
#include "commonattrs/commonattrs_width_test.cpp"
#include "commonattrs/commonattrs_zindex_test.cpp"
#include "commonattrs/commonattrs_animate_test.cpp"
#include "commonattrs/commonattrs_focusstatus_test.h"
#include "commonattrs/commonattrs_touchable_test.h"
#include "commonattrs/commonattrs_focusontouch_test.h"
#include "commonattrs/commonattrs_hittestbehavior_test.h"
#include "commonattrs/commonattrs_id_test.h"
#include "commonattrs/commonattrs_enabled_test.h"
#include "commonattrs/commonattrs_focusable_test.h"
#include "image/image_hittestbehavior_test.h"
#include "image/image_id_test.h"
#include "image/image_oncomplete_test.h"
#include "image/image_onerror_test.h"
#include "image/image_onfinish_test.h"
#include "image/image_downprogress_test.h"
#include "image/image_draggableEvent_test.h"
#include "image/image_autoresize_test.cpp"
#include "image/image_backgroundcolor_test.cpp"
#include "image/image_blur_test.cpp"
#include "image/image_bordercolor_test.cpp"
#include "image/image_borderradius_test.cpp"
#include "image/image_borderstyle_test.cpp"
#include "image/image_borderwidth_test.cpp"
#include "image/image_brightness_test.cpp"
#include "image/image_colorfilter_test.cpp"
#include "image/image_height_test.cpp"
#include "image/image_interpolation_test.cpp"
#include "image/image_lineargradient_test.cpp"
#include "image/image_objectfit_test.cpp"
#include "image/image_objectrepeat_test.cpp"
#include "image/image_opacity_test.cpp"
#include "image/image_position_test.cpp"
#include "image/image_radialgradient_test.cpp"
#include "image/image_rotate_test.cpp"
#include "image/image_saturate_test.cpp"
#include "image/image_scale_test.cpp"
#include "image/image_shadow_test.cpp"
#include "image/image_sweepgradient_test.cpp"
#include "image/image_transform_test.cpp"
#include "image/image_translate_test.cpp"
#include "image/image_width_test.cpp"
#include "image/image_draggable_test.cpp"
#include "image/image_renderMode_test.cpp"
#include "image/image_fitOriginalSize_test.cpp"
#include "image/image_fillColor_test.cpp"
#include "image/image_resizable_test.cpp"
#include "list/list_hittestbehavior_test.h"
#include "list/list_event_test.h"
#include "list/list_scroll_offset_test.h"
#include "list/list_scroll_page_test.h"
#include "list/list_scroll_by_test.h"
#include "list/list_close_all_action_test.h"
#include "list/list_nested_scroll_event_test.h"
#include "list/list_scroll_bar_color_test.cpp"
#include "list/list_scroll_bar_width_test.cpp"
#include "list/list_space_test.cpp"
#include "list/list_align_list_item_test.cpp"
#include "list/list_list_node_adapter_test.cpp"
#include "list/list_initial_index_test.cpp"
#include "list/list_divider_test.cpp"
#include "list/list_item_group_set_header_test.cpp"
#include "list/list_item_group_set_footer_test.cpp"
#include "list/list_item_group_set_divider_test.cpp"
#include "list/list_item_swipe_action_test.cpp"
#include "list/list_scroll_edge_test.cpp"
#include "list/list_children_main_size_test.cpp"
#include "list/list_nested_scroll_test.cpp"
#include "list/list_backgroundcolor_test.cpp"
#include "list/list_blur_test.cpp"
#include "list/list_bordercolor_test.cpp"
#include "list/list_borderradius_test.cpp"
#include "list/list_borderwidth_test.cpp"
#include "list/list_brightness_test.cpp"
#include "list/list_cachedcount_test.cpp"
#include "list/list_edgeeffect_test.cpp"
#include "list/list_enablescrollinteraction_test.cpp"
#include "list/list_friction_test.cpp"
#include "list/list_height_test.cpp"
#include "list/list_lineargradient_test.cpp"
#include "list/list_listdirection_test.cpp"
#include "list/list_opacity_test.cpp"
#include "list/list_rotate_test.cpp"
#include "list/list_saturate_test.cpp"
#include "list/list_scale_test.cpp"
#include "list/list_scrollbar_test.cpp"
#include "list/list_shadow_test.cpp"
#include "list/list_sticky_test.cpp"
#include "list/list_translate_test.cpp"
#include "list/list_width_test.cpp"
#include "list/list_swipeActionItem_test.cpp"
#include "list/list_nodeadapter_test.cpp"
#include "list/list_nodeadapterevent_test.cpp"
#include "listitem/listitem_backgroundcolor_test.cpp"
#include "listitem/listitem_blur_test.cpp"
#include "listitem/listitem_bordercolor_test.cpp"
#include "listitem/listitem_borderradius_test.cpp"
#include "listitem/listitem_borderwidth_test.cpp"
#include "listitem/listitem_brightness_test.cpp"
#include "listitem/listitem_height_test.cpp"
#include "listitem/listitem_lineargradient_test.cpp"
#include "listitem/listitem_opacity_test.cpp"
#include "listitem/listitem_rotate_test.cpp"
#include "listitem/listitem_saturate_test.cpp"
#include "listitem/listitem_scale_test.cpp"
#include "listitem/listitem_shadow_test.cpp"
#include "listitem/listitem_translate_test.cpp"
#include "listitem/listitem_width_test.cpp"
#include "listitem/listitem_hittestbehavior_test.h"
#include "scroll/scroll_nestedscroll_test.h"
#include "scroll/scroll_hittestbehavior_test.h"
#include "scroll/scroll_onappear_test.h"
#include "scroll/scroll_onscroll_test.h"
#include "scroll/scroll_onscrolledge_test.h"
#include "scroll/scroll_onscrollframebegin_test.h"
#include "scroll/scroll_onscrollstart_test.h"
#include "scroll/scroll_page_test.h"
#include "scroll/scroll_onscrollstop_test.h"
#include "scroll/scroll_scrolledge_test.h"
#include "scroll/scroll_scrollto_test.h"
#include "scroll/scroll_currentoffset_test.h"
#include "scroll/scroll_scroll_event_test.h"
#include "scroll/scroll_backgroundcolor_test.cpp"
#include "scroll/scroll_barwidth_test.cpp"
#include "scroll/scroll_blur_test.cpp"
#include "scroll/scroll_bordercolor_test.cpp"
#include "scroll/scroll_borderradius_test.cpp"
#include "scroll/scroll_brightness_test.cpp"
#include "scroll/scroll_clip_test.cpp"
#include "scroll/scroll_edgeeffect_test.cpp"
#include "scroll/scroll_enablescrollinteraction_test.cpp"
#include "scroll/scroll_friction_test.cpp"
#include "scroll/scroll_height_test.cpp"
#include "scroll/scroll_lineargradient_test.cpp"
#include "scroll/scroll_opacity_test.cpp"
#include "scroll/scroll_overlay_test.cpp"
#include "scroll/scroll_pageenable_test.cpp"
#include "scroll/scroll_position_test.cpp"
#include "scroll/scroll_rotate_test.cpp"
#include "scroll/scroll_saturate_test.cpp"
#include "scroll/scroll_scale_test.cpp"
#include "scroll/scroll_scrollable_test.cpp"
#include "scroll/scroll_scrollbar_test.cpp"
#include "scroll/scroll_scrollbarcolor_test.cpp"
#include "scroll/scroll_scrollsnap_test.cpp"
#include "scroll/scroll_shadow_test.cpp"
#include "scroll/scroll_translate_test.cpp"
#include "scroll/scroll_borderwidth_test.cpp"
#include "scroll/scroll_width_test.cpp"
#include "imagespan/imagespan_onclick_test.h"
#include "imagespan/imagespan_width_test.cpp"
#include "imagespan/imagespan_height_test.cpp"
#include "imagespan/imagespan_objectfit_test.cpp"
#include "imagespan/imagespan_verticalalign_test.cpp"
#include "imagespan/imagespan_padding_test.cpp"
#include "span/span_onclick_test.h"
#include "span/span_decoration_test.cpp"
#include "span/span_textcase_test.cpp"
#include "span/span_letterspacing_test.cpp"
#include "span/span_lineheight_test.cpp"
#include "span/span_fontcolor_test.cpp"
#include "span/span_fontsize_test.cpp"
#include "span/span_fontstyle_test.cpp"
#include "span/span_fontweight_test.cpp"
#include "span/span_textshadow_test.cpp"
#include "span/span_textBackgroundStyle_test.cpp"
#include "span/span_baseLineOffset_test.cpp"
#include "flex/flex_width_test.cpp"
#include "flex/flex_height_test.cpp"
#include "flex/flex_option_test.cpp"
#include "column/column_foregroundblurstyle_test.cpp"
#include "column/column_width_test.cpp"
#include "column/column_height_test.cpp"
#include "column/column_padding_test.cpp"
#include "column/column_justifyContent_test.cpp"
#include "column/column_alignItems_test.cpp"
#include "row/row_height_test.cpp"
#include "row/row_justifyContent_test.cpp"
#include "row/row_alignItems_test.cpp"
#include "commonevent/commonevent_event_test.h"
#include "commonevent/commonevent_onappear_test.h"
#include "commonevent/commonevent_ontouch_test.h"
#include "commonevent/pointevent_ontouch_test.h"
#include "commonevent/commonevent_onareachange_test.h"
#include "commonevent/commonevent_onblur_test.h"
#include "commonevent/commonevent_onfocus_test.h"
#include "commonevent/commonevent_onclick_test.h"
#include "datepicker/datepicker_ondatechange_test.h"
#include "datepicker/datepicker_enabled_test.h"
#include "arkApi/arkApi.cpp"
#include "animation/animation.cpp"
#include "animation/animateoption.cpp"
#include "animation/keyframeanimateoption.cpp"
#include "animation/animatecurve.cpp"
#include "animation/geometrytransition.cpp"
#include "animation/animatoroption.cpp"
#include "animation/animator_event_test.h"
#include "animation/animation_event_test.h"
#include "accessibilityState/accessibilityState.cpp"
#include "relativecontainer/relativecontainer_alignmentruleoptionaddition_test.cpp"
#include "relativecontainer/relativecontainer_guidelineoption_test.cpp"
#include "relativecontainer/relativecontainer_barrieroption_test.cpp"
#include "relativecontaine/relativecontaine_alignmentruleoption_test.cpp"
#include "relativecontaine/relativecontaine_barrieroption_test.cpp"
#include "gesture/gesture_test.h"
#include "gesture/gesture_creategesture_test.h"
#include "gesture/gesture_gestureinterrupter_test.h"
#include "gesture/gesture_gestureinfo_test.h"
#include "gesture/gesture_gestureattrs_test.cpp"
#include "gestureScroll/gesture_interfaceTest.h"
#include "gestureScroll/gesture_interfaceParameterTest.cpp"
#include "grid/grid_columnsGap_test.cpp"
#include "grid/grid_rowsGap_test.cpp"
#include "grid/grid_cachedCount_test.cpp"
#include "grid/grid_nodeadapter_test.h"
#include "radio/radio_radioStyle_test.cpp"
#include "radio/radio_checked_test.cpp"
#include "radio/radio_onChange_test.h"
#include "drawabledescriptor/drawabledescriptor_create_test.cpp"
#include "nodecontent/node_content_test.cpp"
#include "nativexcomponent/native_xcomponent_test.cpp"
#include "mouseevent/mouse_event_test.cpp"
#include "pointerevent/pointer_event_test.cpp"
#include "native/native.cpp"
#include "drag/drag_setSuggestedDropOperation.h"
#include "drag/drag_disableDefaultDropAnimation.h"
#include "drag/drag_getPreDragStatus.h"
#include "drag/drag_setDragResult.h"
#include "drag/drag_getDataTypesCount.h"
#include "drag/drag_getDragResult.h"
#include "drag/drag_getXY.h"
#include "drag/drag_getWidthHeight.h"
#include "drag/drag_getModifierKeyStates.h"
#include "drag/drag_getDropOperation.h"
#include "drag/dragAction_createDragAction.h"
#include "drag/dragAction_setPointerId.h"
#include "drag/dragAction_setDragPreviewOption.h"
#include "drag/dragAction_setTouchPointXY.h"
#include "drag/dragAction_registerStatusListener.h"
#include "drag/drag_getDragEvent.cpp"
#include "drag/drag_getDataTypes.cpp"
#include "drag/drag_setGetUdmfData.cpp"
#include "drag/drag_setDragEventStrictReport.cpp"
#include "drag/drag_allowDropDataTypes.cpp"
#include "drag/drag_setNodeDragPreview.cpp"
#include "drag/drag_dragPreviewOption.cpp"
#include "drag/drag_dragAction.cpp"

// char *
#include "datepicker/datepicker_textstyle_test.cpp"
#include "datepicker/datepicker_disappeartextstyle_test.cpp"
#include "datepicker/datepicker_selectedtextstyle_test.cpp"
#include "datepicker/datepicker_selected_test.cpp"
#include "datepicker/datepicker_start_test.cpp"
#include "datepicker/datepicker_end_test.cpp"
#include "slider/slider_blockstyle_test.cpp"
#include "customcomponent/customcomponent_accessibilitytext_test.cpp"
#include "customcomponent/customcomponent_clip_test.cpp"
#include "customcomponent/customcomponent_accessibilitydescription_test.cpp"
#include "customcomponent/customcomponent_mask_test.cpp"
#include "commonattrs/commonattrs_overlay_test.cpp"
#include "commonattrs/commonattrs_backgroundimage_test.cpp"
#include "commonattrs/commonattrs_mask_test.cpp"
#include "commonattrs/commonattrs_clipshape_test.cpp"
#include "commonattrs/commonattrs_clip_test.cpp"
#include "image/image_src_test.cpp"
#include "image/image_clip_test.cpp"
#include "image/image_alt_test.cpp"
#include "list/list_clip_test.cpp"
#include "list/list_childMainSize_test.cpp"
#include "listitem/listitem_clip_test.cpp"
#include "imagespan/imagespan_src_test.cpp"
#include "imagespan/imagespan_alt_test.cpp"
#include "span/span_content_test.cpp"
#include "span/span_fontfamily_test.cpp"
#include "radio/radio_value_test.cpp"
#include "radio/radio_group_test.cpp"
#include "grid/grid_rowsTemplate_test.cpp"
#include "grid/grid_columnTemplate_test.cpp"

namespace {
    //定义 Native 方法签名，冒号”:“ 左边为方法入参，后边为接口返回值，无返回值则不写。 特殊的类型需要对接口进行反汇编获取具体的类型
    const char *testSignature = "C{arkui.Content.Content}:";
    //定义 Native 方法数组，内为arkts侧需要用到的C方法。参数1是arkts接口，参数3是映射的对应C接口。

    std::array methods = {
        ani_native_function {"drag_getDragEvent_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_getDragEvent_001)},
        ani_native_function {"drag_getDataTypes_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_getDataTypes_001)},
        ani_native_function {"drag_setGetUdmfData_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_setGetUdmfData_001)},
        ani_native_function {"drag_setGetUdmfData_002", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_setGetUdmfData_002)},
        ani_native_function {"drag_setGetUdmfData_003", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_setGetUdmfData_003)},    
        ani_native_function {"drag_setDragEventStrictReportWidthNode_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_setDragEventStrictReportWidthNode_001)},
        ani_native_function {"drag_setDragEventStrictReportWidthNode_002", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_setDragEventStrictReportWidthNode_002)},
        ani_native_function {"drag_setDragEventStrictReportWidthContext_003", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_setDragEventStrictReportWidthContext_003)},
        ani_native_function {"drag_setDragEventStrictReportWidthContext_004", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_setDragEventStrictReportWidthContext_004)},
        ani_native_function {"drag_setNodeAllowedDropDataTypes_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_setNodeAllowedDropDataTypes_001)},
        ani_native_function {"drag_disallowNodeAnyDropDataTypes_002", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_disallowNodeAnyDropDataTypes_002)},
        ani_native_function {"drag_allowNodeAllDropDataTypes_003", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_allowNodeAllDropDataTypes_003)},
        ani_native_function {"drag_setNodeDraggable_004", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_setNodeDraggable_004)},
        ani_native_function {"drag_SetNodeDragPreview_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_SetNodeDragPreview_001)},
        ani_native_function {"drag_DragPreviewOption_Dispose_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragPreviewOption_Dispose_001)},
        ani_native_function {"drag_DragPreviewOption_SetScaleMode_002", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragPreviewOption_SetScaleMode_002)},
        ani_native_function {"drag_DragPreviewOption_SetDefaultShadowEnabled_003", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragPreviewOption_SetDefaultShadowEnabled_003)},
        ani_native_function {"drag_DragPreviewOption_SetDefaultRadiusEnabled_004", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragPreviewOption_SetDefaultRadiusEnabled_004)},
        ani_native_function {"drag_DragPreviewOption_SetNumberBadgeEnabled_005", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragPreviewOption_SetNumberBadgeEnabled_005)},
        ani_native_function {"drag_DragPreviewOption_SetBadgeNumber_006", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragPreviewOption_SetBadgeNumber_006)},
        ani_native_function {"drag_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled_007", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled_007)},
        ani_native_function {"drag_DragPreviewOption_SetNodeDragPreviewOption_008", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragPreviewOption_SetNodeDragPreviewOption_008)},
        ani_native_function {"drag_DragAction_Dispose_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragAction_Dispose_001)},
        ani_native_function {"drag_DragAction_SetPointerId_002", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragAction_SetPointerId_002)},
        ani_native_function {"drag_DragAction_SetPixelMaps_003", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragAction_SetPixelMaps_003)},
        ani_native_function {"drag_DragAction_SetTouchPointX_004", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragAction_SetTouchPointX_004)},
        ani_native_function {"drag_DragAction_SetTouchPointY_005", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragAction_SetTouchPointY_005)},
        ani_native_function {"drag_DragAction_SetDragPreviewOption_006", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragAction_SetDragPreviewOption_006)},
        ani_native_function {"drag_DragAction_RegisterStatusListener_007", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragAction_RegisterStatusListener_007)},
        ani_native_function {"drag_DragAction_UnregisterStatusListener_008", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragAction_UnregisterStatusListener_008)},
        ani_native_function {"drag_DragAction_StartDrag_009", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragAction_StartDrag_009)},
        ani_native_function {"drag_DragAction_DragAndDropInfo_0010", ":d", reinterpret_cast<void *>(ArkUIAniTest::drag_DragAction_DragAndDropInfo_0010)},    
        ani_native_function {"disableDefaultDropAnimationTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::DisableDefaultDropAnimationTest::CreateNativeNode)},
        ani_native_function {"getDataTypesCountTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GetDataTypesCountTest::CreateNativeNode)},
        ani_native_function {"getDragResultTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GetDragResultTest::CreateNativeNode)},
        ani_native_function {"getModifierKeyStatesTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GetModifierKeyStatesTest::CreateNativeNode)},
        ani_native_function {"getPreDragStatusTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GetPreDragStatusTest::CreateNativeNode)},
        ani_native_function {"getWidthHeightTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GetWidthHeightTest::CreateNativeNode)},
        ani_native_function {"getXYTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GetXYTest::CreateNativeNode)},
        ani_native_function {"setDragResultTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SetDragResultTest::CreateNativeNode)},
        ani_native_function {"setSuggestedDropOperationTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SetSuggestedDropOperationTest::CreateNativeNode)},
        ani_native_function {"createDragActionTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CreateDragActionTest::CreateNativeNode)},
        ani_native_function {"registerStatusListenerTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::RegisterStatusListenerTest::CreateNativeNode)},
        ani_native_function {"setDragPreviewOptionTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SetDragPreviewOptionTest::CreateNativeNode)},
        ani_native_function {"setPointerIdTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SetPointerIdTest::CreateNativeNode)},
        ani_native_function {"setTouchPointXYTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SetTouchPointXYTest::CreateNativeNode)},
        ani_native_function {"getDropOperationTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GetDropOperationTest::CreateNativeNode)},    
        ani_native_function {"native_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_001)},
        ani_native_function {"native_002", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_002)},
        ani_native_function {"native_003", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_003)},
        ani_native_function {"native_005", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_005)},
        ani_native_function {"native_006", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_006)},
        ani_native_function {"native_007", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_007)},
        ani_native_function {"native_008", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_008)},
        ani_native_function {"native_009", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_009)},
        ani_native_function {"native_010", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_010)},
        ani_native_function {"native_011", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_011)},
        ani_native_function {"native_012", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_012)},
        ani_native_function {"native_013", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_013)},
        ani_native_function {"native_014", ":d", reinterpret_cast<void *>(ArkUIAniTest::native_014)},     
        ani_native_function {"testPointerEvent001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestPointerEvent001)},
        ani_native_function {"testNativeXComponent001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNativeXComponent001)},
        ani_native_function {"testMouseEvent001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestMouseEvent001)},
        ani_native_function {"testMouseEvent002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestMouseEvent002)},    
        ani_native_function {"testNodeContent001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeContent001)},
        ani_native_function {"testNodeContent002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeContent002)},
        ani_native_function {"testNodeContent003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeContent003)},
        ani_native_function {"testNodeContent004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeContent004)},
        ani_native_function {"testNodeContent005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeContent005)},
        ani_native_function {"testNodeContent006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeContent006)},
        ani_native_function {"testNodeContent007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeContent007)},    
        ani_native_function {"testDrawableDescriptorCreate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDrawableDescriptorCreate001)},
        ani_native_function {"testDrawableDescriptorCreate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDrawableDescriptorCreate002)},
        ani_native_function {"testDrawableDescriptorCreate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDrawableDescriptorCreate003)},      
        ani_native_function {"testCommonAttrsAnimate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAnimate001)},
        ani_native_function {"testCommonAttrsAnimate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAnimate002)},
        ani_native_function {"testCommonAttrsAnimate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAnimate003)},
        ani_native_function {"testCommonAttrsAnimate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAnimate004)},    
        ani_native_function {"customComponentEventTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentEventTest::CreateNativeNode)},
       
    
    
        ani_native_function {"testRadioChecked001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioChecked001)},
        ani_native_function {"testRadioChecked002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioChecked002)},
        ani_native_function {"testRadioChecked003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioChecked003)},
        ani_native_function {"testRadioChecked004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioChecked004)},
        ani_native_function {"testRadioChecked005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioChecked005)},
        ani_native_function {"testRadioChecked006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioChecked006)},
        ani_native_function {"testRadioChecked007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioChecked007)},     
        ani_native_function {"testRadioRadioStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioRadioStyle001)},
        ani_native_function {"testRadioRadioStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioRadioStyle002)},
        ani_native_function {"testRadioRadioStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioRadioStyle003)},
        ani_native_function {"testRadioRadioStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioRadioStyle004)},
        ani_native_function {"testRadioRadioStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioRadioStyle005)},    
        ani_native_function {"testRadioGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioGroup001)},
        ani_native_function {"testRadioGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioGroup002)},
        ani_native_function {"testRadioGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioGroup003)},    
        ani_native_function {"testRadioValue001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioValue001)},
        ani_native_function {"testRadioValue002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioValue002)},
        ani_native_function {"testRadioValue003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRadioValue003)},    
        ani_native_function {"testGridCachedCount001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridCachedCount001)},
        ani_native_function {"testGridCachedCount002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridCachedCount002)},
        ani_native_function {"testGridCachedCount003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridCachedCount003)},
        ani_native_function {"testGridCachedCount004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridCachedCount004)},
        ani_native_function {"testGridCachedCount005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridCachedCount005)},     
        ani_native_function {"testGridRowsGap001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridRowsGap001)},
        ani_native_function {"testGridRowsGap002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridRowsGap002)},
        ani_native_function {"testGridRowsGap003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridRowsGap003)},
        ani_native_function {"testGridRowsGap004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridRowsGap004)},
        ani_native_function {"testGridColumnTemplate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridColumnTemplate001)},
        ani_native_function {"testGridColumnTemplate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridColumnTemplate002)},
        ani_native_function {"testGridColumnTemplate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridColumnTemplate003)},      
        ani_native_function {"testGridRowsTemplate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridRowsTemplate001)},
        ani_native_function {"testGridRowsTemplate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridRowsTemplate002)},
        ani_native_function {"testGridRowsTemplate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridRowsTemplate003)},    
        ani_native_function {"testGridColumnsGap001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridColumnsGap001)},
        ani_native_function {"testGridColumnsGap002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridColumnsGap002)},
        ani_native_function {"testGridColumnsGap003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridColumnsGap003)},
        ani_native_function {"testGridColumnsGap004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestGridColumnsGap004)},    
        ani_native_function {"gestureNestScrollTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureInterfaceTest::CreateNativeNode)},
        ani_native_function {"gestureTestParaMeter001", ":d", reinterpret_cast<void *>(ArkUIAniTest::gestureTestParaMeter001)},
        ani_native_function {"gestureTestParaMeter002", ":d", reinterpret_cast<void *>(ArkUIAniTest::gestureTestParaMeter002)},
        ani_native_function {"gestureTestParaMeter003", ":d", reinterpret_cast<void *>(ArkUIAniTest::gestureTestParaMeter003)},
        ani_native_function {"gestureTestParaMeter004", ":d", reinterpret_cast<void *>(ArkUIAniTest::gestureTestParaMeter004)},
        ani_native_function {"gestureTestParaMeter005", ":d", reinterpret_cast<void *>(ArkUIAniTest::gestureTestParaMeter005)},
        ani_native_function {"gestureTestParaMeter006", ":d", reinterpret_cast<void *>(ArkUIAniTest::gestureTestParaMeter006)},
        ani_native_function {"gestureTestParaMeter007", ":d", reinterpret_cast<void *>(ArkUIAniTest::gestureTestParaMeter007)},
        ani_native_function {"gestureTestParaMeter008", ":d", reinterpret_cast<void *>(ArkUIAniTest::gestureTestParaMeter008)},
        ani_native_function {"gestureTestParaMeter009", ":d", reinterpret_cast<void *>(ArkUIAniTest::gestureTestParaMeter009)},  
        ani_native_function {"gestureGestureInfoTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureGestureInfoTest::CreateNativeNode)},
        ani_native_function {"gestureGestureInterrupterTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureGestureInterrupterTest::CreateNativeNode)},
        ani_native_function {"gestureCreateGestureTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureCreateGestureTest::CreateNativeNode)},
        ani_native_function {"gestureCreateGesture1Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureCreateGestureTest::CreateNativeNode1)},
        ani_native_function {"gestureCreateGesture2Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureCreateGestureTest::CreateNativeNode2)},
        ani_native_function {"gestureCreateGesture3Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureCreateGestureTest::CreateNativeNode3)},
        ani_native_function {"gestureCreateGesture4Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureCreateGestureTest::CreateNativeNode4)},      
        ani_native_function {"testRemoveGestureFromNode001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRemoveGestureFromNode001)},
        ani_native_function {"testSetGestureInterrupterToNode001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSetGestureInterrupterToNode001)},
        ani_native_function {"testDisposeToNode001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDisposeToNode001)},    
        ani_native_function {"testAddGestureToNode001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddGestureToNode001)},
        ani_native_function {"testAddGestureToNode002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddGestureToNode002)},
        ani_native_function {"testAddGestureToNode003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddGestureToNode003)},
        ani_native_function {"testAddGestureToNode004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddGestureToNode004)},
        ani_native_function {"testAddGestureToNode005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddGestureToNode005)},
        ani_native_function {"testAddGestureToNode006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddGestureToNode006)},
        ani_native_function {"longPressGestureTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureTest::CreateLongPressNativeNode)},
        ani_native_function {"swipeGestureTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureTest::CreateSwipeNativeNode)},
        ani_native_function {"panGestureTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureTest::CreatePanNativeNode)},
        ani_native_function {"rotateGestureTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureTest::CreateRotateNativeNode)},
        ani_native_function {"pinchGestureTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureTest::CreatePinchNativeNode)},
        ani_native_function {"interruptGestureTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureTest::CreateInterruptNativeNode)},    
        ani_native_function {"swipeAxisGestureTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureTest::CreateSwipeAxisNativeNode)},
        ani_native_function {"gestureGestureInfoTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureGestureInfoTest::CreateNativeNode)},
        ani_native_function {"testAddChildGesture001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddChildGesture001)},
        ani_native_function {"testAddChildGesture002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddChildGesture002)},
        ani_native_function {"testAddChildGesture003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddChildGesture003)},
        ani_native_function {"testAddChildGesture004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddChildGesture004)},
        ani_native_function {"testAddChildGesture005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddChildGesture005)},
        ani_native_function {"testAddChildGesture006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAddChildGesture006)}, 
        ani_native_function {"testRemoveChildGesture001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRemoveChildGesture001)},
        ani_native_function {"testRemoveChildGesture002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRemoveChildGesture002)},
        ani_native_function {"testRemoveChildGesture003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRemoveChildGesture003)},
        ani_native_function {"testRemoveChildGesture004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRemoveChildGesture004)},
        ani_native_function {"testRemoveChildGesture005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRemoveChildGesture005)},
        ani_native_function {"testRemoveChildGesture006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRemoveChildGesture006)},
        ani_native_function {"testSetGestureEventTarget001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSetGestureEventTarget001)},
        ani_native_function {"testSetGestureEventTarget002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSetGestureEventTarget002)},
        ani_native_function {"testSetGestureEventTarget003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSetGestureEventTarget003)},
        ani_native_function {"testSetGestureEventTarget004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSetGestureEventTarget004)},
        ani_native_function {"gestureCreateGestureTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureCreateGestureTest::CreateNativeNode)},
        ani_native_function {"gestureCreateGesture1Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureCreateGestureTest::CreateNativeNode1)},
        ani_native_function {"gestureCreateGesture2Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureCreateGestureTest::CreateNativeNode2)},
        ani_native_function {"gestureCreateGesture3Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureCreateGestureTest::CreateNativeNode3)},
        ani_native_function {"gestureCreateGesture4Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureCreateGestureTest::CreateNativeNode4)},    
        ani_native_function {"gestureGestureInterrupterTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureGestureInterrupterTest::CreateNativeNode)},    
        ani_native_function {"testRelativeContaineBarrierOption001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineBarrierOption001)},
        ani_native_function {"testRelativeContaineBarrierOption002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineBarrierOption002)},
        ani_native_function {"testRelativeContaineBarrierOption003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineBarrierOption003)},    
        ani_native_function {"testRelativeContaineAlignmentRuleOption001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOption001)},
        ani_native_function {"testRelativeContaineAlignmentRuleOption002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOption002)},
        ani_native_function {"testRelativeContaineAlignmentRuleOption003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOption003)},    
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetCenterVertical001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetCenterVertical001)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetCenterVertical002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetCenterVertical002)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetCenterVertical003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetCenterVertical003)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetBiasHorizontal001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetBiasHorizontal001)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetBiasHorizontal002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetBiasHorizontal002)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetBiasVertical001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetBiasVertical001)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetBiasVertical002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetBiasVertical002)},       
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetBottom001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetBottom001)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetBottom002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetBottom002)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetBottom003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetBottom003)},    
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetTop001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetTop001)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetTop002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetTop002)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetTop003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetTop003)},    
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetCenterHorizontal001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetCenterHorizontal001)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetCenterHorizontal002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetCenterHorizontal002)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetCenterHorizontal003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetCenterHorizontal003)},    
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetEnd001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetEnd001)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetEnd002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetEnd002)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetEnd003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetEnd003)},    
        ani_native_function {"testRelativeContaineAlignmentRuleOptionCreate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionCreate001)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionDispose001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionDispose001)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetStart001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetStart001)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetStart002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetStart002)},
        ani_native_function {"testRelativeContaineAlignmentRuleOptionSetStart003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContaineAlignmentRuleOptionSetStart003)},    
        ani_native_function {"testRelativeContainerBarrierOptionGetReferencedSize001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionGetReferencedSize001)},
        ani_native_function {"testRelativeContainerBarrierOptionGetReferencedSize002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionGetReferencedSize002)},     
        ani_native_function {"testRelativeContainerBarrierOptionGetReferencedId001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionGetReferencedId001)},
        ani_native_function {"testRelativeContainerBarrierOptionGetReferencedId002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionGetReferencedId002)},
        ani_native_function {"testRelativeContainerBarrierOptionGetReferencedId003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionGetReferencedId003)},    
        ani_native_function {"testRelativeContainerBarrierOptionSetReferencedId001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetReferencedId001)},
        ani_native_function {"testRelativeContainerBarrierOptionSetReferencedId002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetReferencedId002)},
        ani_native_function {"testRelativeContainerBarrierOptionSetReferencedId003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetReferencedId003)},    
        ani_native_function {"testRelativeContainerBarrierOptionGetDirection001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionGetDirection001)},
        ani_native_function {"testRelativeContainerBarrierOptionGetDirection002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionGetDirection002)},    
        ani_native_function {"testRelativeContainerBarrierOptionSetDirection001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetDirection001)},
        ani_native_function {"testRelativeContainerBarrierOptionSetDirection002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetDirection002)},
        ani_native_function {"testRelativeContainerBarrierOptionSetDirection003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetDirection003)},
        ani_native_function {"testRelativeContainerBarrierOptionSetDirection004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetDirection004)},
        ani_native_function {"testRelativeContainerBarrierOptionSetDirection005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetDirection005)},
        ani_native_function {"testRelativeContainerBarrierOptionSetDirection006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetDirection006)},    
        ani_native_function {"testRelativeContainerBarrierOptionSetId001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetId001)},
        ani_native_function {"testRelativeContainerBarrierOptionSetId002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetId002)},
        ani_native_function {"testRelativeContainerBarrierOptionSetId003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetId003)},
        ani_native_function {"testRelativeContainerBarrierOptionSetId004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionSetId004)},
        ani_native_function {"testRelativeContainerBarrierOptionGetId001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionGetId001)},
        ani_native_function {"testRelativeContainerBarrierOptionGetId002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionGetId002)},    
        ani_native_function {"testRelativeContainerBarrierOptionCreate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionCreate001)},
        ani_native_function {"testRelativeContainerBarrierOptionDispose001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerBarrierOptionDispose001)},    
        ani_native_function {"testRelativeContainerGuidelineOptionGetPositionEnd001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionGetPositionEnd001)},
        ani_native_function {"testRelativeContainerGuidelineOptionGetPositionEnd002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionGetPositionEnd002)},    
        ani_native_function {"testRelativeContainerGuidelineOptionSetPositionEnd001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetPositionEnd001)},
        ani_native_function {"testRelativeContainerGuidelineOptionSetPositionEnd002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetPositionEnd002)},
        ani_native_function {"testRelativeContainerGuidelineOptionSetPositionEnd003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetPositionEnd003)},
        ani_native_function {"testRelativeContainerGuidelineOptionSetPositionEnd004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetPositionEnd004)},    
        ani_native_function {"testRelativeContainerGuidelineOptionGetPositionStart001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionGetPositionStart001)},
        ani_native_function {"testRelativeContainerGuidelineOptionGetPositionStart002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionGetPositionStart002)},    
        ani_native_function {"testRelativeContainerGuidelineOptionSetPositionStart001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetPositionStart001)},
        ani_native_function {"testRelativeContainerGuidelineOptionSetPositionStart002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetPositionStart002)},
        ani_native_function {"testRelativeContainerGuidelineOptionSetPositionStart003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetPositionStart003)},
        ani_native_function {"testRelativeContainerGuidelineOptionSetPositionStart004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetPositionStart004)},    
        ani_native_function {"testRelativeContainerGuidelineOptionGetDirection001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionGetDirection001)},
        ani_native_function {"testRelativeContainerGuidelineOptionGetDirection002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionGetDirection002)},    
        ani_native_function {"testRelativeContainerGuidelineOptionSetDirection001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetDirection001)},
        ani_native_function {"testRelativeContainerGuidelineOptionSetDirection002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetDirection002)},    
        ani_native_function {"testRelativeContainerGuidelineOptionGetId001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionGetId001)},
        ani_native_function {"testRelativeContainerGuidelineOptionGetId002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionGetId002)},    
        ani_native_function {"testRelativeContainerGuidelineOptionCreate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionCreate001)},
        ani_native_function {"testRelativeContainerGuidelineOptionDispose001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionDispose001)},
        ani_native_function {"testRelativeContainerGuidelineOptionSetId001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetId001)},
        ani_native_function {"testRelativeContainerGuidelineOptionSetId002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetId002)},
        ani_native_function {"testRelativeContainerGuidelineOptionSetId003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetId003)},
        ani_native_function {"testRelativeContainerGuidelineOptionSetId004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRelativeContainerGuidelineOptionSetId004)},
        ani_native_function {"accessibilityState_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::accessibilityState_001)},
        ani_native_function {"accessibilityState_002", ":d", reinterpret_cast<void *>(ArkUIAniTest::accessibilityState_002)},
        ani_native_function {"accessibilityState_003", ":d", reinterpret_cast<void *>(ArkUIAniTest::accessibilityState_003)},
        ani_native_function {"testAnimation_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::testAnimation_001)},
        ani_native_function {"testAnimation_002", ":d", reinterpret_cast<void *>(ArkUIAniTest::testAnimation_002)},
        ani_native_function {"testAnimation_003", ":d", reinterpret_cast<void *>(ArkUIAniTest::testAnimation_003)},
        ani_native_function {"testAnimation_004", ":d", reinterpret_cast<void *>(ArkUIAniTest::testAnimation_004)},
        ani_native_function {"testAnimation_005", ":d", reinterpret_cast<void *>(ArkUIAniTest::testAnimation_005)},
        ani_native_function {"TestArkUIAddApi001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi001)},
        ani_native_function {"TestArkUIAddApi002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi002)},
        ani_native_function {"TestArkUIAddApi003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi003)},
        ani_native_function {"TestArkUIAddApi004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi004)},
        ani_native_function {"TestArkUIAddApi005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi005)},
        ani_native_function {"TestArkUIAddApi006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi006)},
        ani_native_function {"TestArkUIAddApi007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi007)},
        ani_native_function {"TestArkUIAddApi008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi008)},
        ani_native_function {"TestArkUIAddApi009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi009)},
        ani_native_function {"TestArkUIAddApi010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi010)},
        ani_native_function {"TestArkUIAddApi011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi011)},
        ani_native_function {"TestArkUIAddApi012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi012)},
        ani_native_function {"TestArkUIAddApi013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi013)},
        ani_native_function {"TestArkUIAddApi014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi014)},
        ani_native_function {"TestArkUIAddApi015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi015)},
        ani_native_function {"TestArkUIAddApi016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi016)},
        ani_native_function {"TestArkUIAddApi017", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi017)},
        ani_native_function {"TestArkUIAddApi018", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi018)},
        ani_native_function {"TestArkUIAddApi019", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi019)},
        ani_native_function {"TestArkUIAddApi020", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi020)},
        ani_native_function {"TestArkUIAddApi021", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi021)},
        ani_native_function {"TestArkUIAddApi022", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi022)},
        ani_native_function {"TestArkUIAddApi023", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi023)},
        ani_native_function {"TestArkUIAddApi024", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestArkUIAddApi024)},
        ani_native_function {"scrollScrollToLinearTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNode)},
        ani_native_function {"scrollScrollToEaseTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeEase)},
        ani_native_function {"scrollScrollToEaseInTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeEaseIn)},
        ani_native_function {"scrollScrollToEaseOutTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeEaseOut)},
        ani_native_function {"scrollScrollToEaseInOutTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeEaseInOut)},
        ani_native_function {"scrollScrollToFastOutSlowInTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeFastOutSlowIn)},
        ani_native_function {"scrollScrollToLinearOutSlowInTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeLinearOutSlowIn)},
        ani_native_function {"scrollScrollToFastOutLinearInTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeFastOutLinearIn)},
        ani_native_function {"scrollScrollToExtremeDecelerationTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeExtremeDeceleration)},
        ani_native_function {"scrollScrollToSharpTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeSharp)},
        ani_native_function {"scrollScrollToRhythmTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeRhythm)},
        ani_native_function {"scrollScrollToSmoothTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeSmooth)},
        ani_native_function {"scrollScrollToFrictionTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeFriction)},
        ani_native_function {"scrollScrollToCanOverScrollTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeCanOverScroll)},
        ani_native_function {"scrollScrollToCanOverScrollOffTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeCanOverScrollOff)},    
        ani_native_function {"scrollScrollTo001Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeScrollTo001)},
        ani_native_function {"scrollScrollTo002Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeScrollTo002)},
        ani_native_function {"scrollScrollTo003Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeScrollTo003)},
        ani_native_function {"scrollScrollTo004Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeScrollTo004)},
        ani_native_function {"scrollScrollTo005Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeScrollTo005)},
        ani_native_function {"scrollScrollTo006Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeScrollTo006)},
        ani_native_function {"scrollScrollTo007Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollToTest::CreateNativeNodeScrollTo007)},
        ani_native_function {"refreshOnRefreshingTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::RefreshOnRefreshingTest::CreateNativeNode)},
        ani_native_function {"refreshOnStateChangeTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::RefreshOnStateChangeTest::CreateNativeNode)},
        ani_native_function {"sliderOnChangeTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SliderOnChangeTest::CreateNativeNode)},
        ani_native_function {"buttonOnClickTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ButtonOnClickTest::CreateNativeNode)},
        ani_native_function {"customComponentOnMeasureTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentOnMeasureTest::CreateNativeNode)},
        ani_native_function {"customComponentOnLayoutTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentOnLayoutTest::CreateNativeNode)},
        ani_native_function {"customComponentOnDrawTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentOnDrawTest::CreateNativeNode)},
        ani_native_function {"scrollCurrentOffsetLinearTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNode)},
        ani_native_function {"scrollCurrentOffsetEaseTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeEase)},
        ani_native_function {"scrollCurrentOffsetEaseInOutTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeEaseInOut)},
        ani_native_function {"scrollCurrentOffsetEaseInTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeEaseIn)},
        ani_native_function {"scrollCurrentOffsetEaseOutTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeEaseOut)},
        ani_native_function {"scrollCurrentOffsetFastOutSlowInTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeFastOutSlowIn)},
        ani_native_function {"scrollCurrentOffsetLinearOutSlowInTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeLinearOutSlowIn)},
        ani_native_function {"scrollCurrentOffsetFastOutLinearInTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeFastOutLinearIn)},
        ani_native_function {"scrollCurrentOffsetExtremeDecelerationTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeExtremeDeceleration)},
        ani_native_function {"scrollCurrentOffsetSharpTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeSharp)},
        ani_native_function {"scrollCurrentOffsetRhythmTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeRhythm)},
        ani_native_function {"scrollCurrentOffsetSmoothTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeSmooth)},    
        ani_native_function {"scrollCurrentOffsetFrictionTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollCurrentOffsetTest::CreateNativeNodeFriction)},
        ani_native_function {"customComponentFocusableTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentFocusableTest::CreateNativeNode)},
        ani_native_function {"customComponentHitTestBehaviorTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentHitTestBehaviorTest::CreateNativeNode)},
        ani_native_function {"customComponentIdTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentIdTest::CreateNativeNode)},
        ani_native_function {"customComponentOnClickTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentOnClickTest::CreateNativeNode)},
        ani_native_function {"customComponentOnTouchTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentOnTouchTest::CreateNativeNode)},
        ani_native_function {"customComponentOnAreaChangeTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentOnAreaChangeTest::CreateNativeNode)},
        ani_native_function {"customComponentOnAppearTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentOnAppearTest::CreateNativeNode)},
        ani_native_function {"customComponentOnBlurTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentOnBlurTest::CreateNativeNode)},
        ani_native_function {"customComponentOnFocusTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentOnFocusTest::CreateNativeNode)},
        ani_native_function {"customComponentEnabledTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CustomComponentEnabledTest::CreateNativeNode)},
        ani_native_function {"checkboxOnChangeTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CheckboxOnChangeTest::CreateNativeNode)},
        ani_native_function {"checkboxEnabledTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CheckboxEnabledTest::CreateNativeNode)},
        ani_native_function {"datePickerOnDateChangeTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::DatePickerOnDateChangeTest::CreateNativeNode)},
        ani_native_function {"datePickerEnabledTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::DatePickerEnabledTest::CreateNativeNode)},
        ani_native_function {"sliderEnabledTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SliderEnabledTest::CreateNativeNode)},
        ani_native_function {"SliderColorTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SliderColorTest::TestSliderColor001)},    
        ani_native_function {"sliderOnChangeTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SliderOnChangeTest::CreateNativeNode)},
        ani_native_function {"scrollHitTestBehaviorDefaultTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollHitTestBehaviorTest::CreateNativeNodeDefault)},
        ani_native_function {"scrollHitTestBehaviorBlockTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollHitTestBehaviorTest::CreateNativeNodeBlock)},
        ani_native_function {"scrollHitTestBehaviorTransparentTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollHitTestBehaviorTest::CreateNativeNodeTransparent)},
        ani_native_function {"scrollHitTestBehaviorNoneTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollHitTestBehaviorTest::CreateNativeNodeNone)},
        ani_native_function {"scrollScrollEdge001Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEdgeTest::CreateNativeNodeScrollEdge001)},
        ani_native_function {"scrollScrollEdge002Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEdgeTest::CreateNativeNodeScrollEdge002)},
        ani_native_function {"scrollScrollEdge003Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEdgeTest::CreateNativeNodeScrollEdge003)}, 
        ani_native_function {"scrollScrollEdgeTest", "C{arkui.Content.Content}i:", reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEdgeTest::CreateNativeNode)},
        ani_native_function {"scrollOnScrollEdgeTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollOnScrollEdgeTest::CreateNativeNode)},
        ani_native_function {"scrollOnAppearTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollOnAppearTest::CreateNativeNode)},
        ani_native_function {"scrollOnScrollStopTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollOnScrollStopTest::CreateNativeNode)},
        ani_native_function {"scrollOnScrollStartTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollOnScrollStartTest::CreateNativeNode)},     
        ani_native_function {"scrollOnScrollFrameBeginTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollOnScrollFrameBeginTest::CreateNativeNode)},
        ani_native_function {"scrollOnScrollTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollOnScrollTest::CreateNativeNode)},
        ani_native_function {"scrollNestedScrollTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollNestedScrollTest::CreateNativeNode)},
        ani_native_function {"testListSwipeActionItem008", ":d", reinterpret_cast<void *>(ArkUIAniTest::listSwipeActionItem008)},
        ani_native_function {"testListSwipeActionItem009", ":d", reinterpret_cast<void *>(ArkUIAniTest::listSwipeActionItem009)},
        ani_native_function {"testListSwipeActionCreate", ":d", reinterpret_cast<void *>(ArkUIAniTest::listSwipeActionCreate)},
        ani_native_function {"testListSwipeActionSetActionAreaDistance001", ":d", reinterpret_cast<void *>(ArkUIAniTest::listSwipeActionSetActionAreaDistance001)},
        ani_native_function {"testListSwipeActionOptionCreate", ":d", reinterpret_cast<void *>(ArkUIAniTest::listSwipeActionOptionCreate)},
        ani_native_function {"testListSwipeActionItem006", ":d", reinterpret_cast<void *>(ArkUIAniTest::listSwipeActionItem006)},
        ani_native_function {"testListSwipeActionItem007", ":d", reinterpret_cast<void *>(ArkUIAniTest::listSwipeActionItem007)},
        ani_native_function {"testListSwipeActionOptionEdgeEffect", ":d", reinterpret_cast<void *>(ArkUIAniTest::listSwipeActionOptionEdgeEffect)},
        ani_native_function {"listItemHitTestBehaviorDefaultTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListItemHitTestBehaviorTest::CreateNativeNodeDefault)},
        ani_native_function {"listItemHitTestBehaviorBlockTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListItemHitTestBehaviorTest::CreateNativeNodeBlock)},
        ani_native_function {"listItemHitTestBehaviorTransparentTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListItemHitTestBehaviorTest::CreateNativeNodeTransparent)},
        ani_native_function {"listItemHitTestBehaviorNoneTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListItemHitTestBehaviorTest::CreateNativeNodeNone)},
        ani_native_function {"listHitTestBehaviorNoneTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListHitTestBehaviorTest::CreateNativeNodeNone)},
        ani_native_function {"listHitTestBehaviorTransparentTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListHitTestBehaviorTest::CreateNativeNodeTransparent)},
        ani_native_function {"listHitTestBehaviorBlockTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListHitTestBehaviorTest::CreateNativeNodeBlock)},
        ani_native_function {"listHitTestBehaviorDefaultTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListHitTestBehaviorTest::CreateNativeNodeDefault)},
        ani_native_function {"imageOnErrorTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ImageOnErrorTest::CreateNativeNode)},
        ani_native_function {"imageOnCompleteTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ImageOnCompleteTest::CreateNativeNode)},
        ani_native_function {"imageIdTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ImageIdTest::CreateNativeNode)},
        ani_native_function {"imageHitTestBehaviorTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ImageHitTestBehaviorTest::CreateNativeNode)},
        ani_native_function {"pointEventOnTouchTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::PointEventOnTouchTest::CreateNativeNode)},
        ani_native_function {"commonAttrsIdTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CommonAttrsIdTest::CreateNativeNode)},
        ani_native_function {"commonEventOnTouchTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CommonEventOnTouchTest::CreateNativeNode)},
        ani_native_function {"commonEventOnAppearTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CommonEventOnAppearTest::CreateNativeNode)},
        ani_native_function {"commonEventOnAreaChangeTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CommonEventOnAreaChangeTest::CreateNativeNode)},    
        ani_native_function {"commonEventOnBlurTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CommonEventOnBlurTest::CreateNativeNode)},
        ani_native_function {"commonEventOnFocusTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CommonEventOnFocusTest::CreateNativeNode)},
        ani_native_function {"commonEventOnClickTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CommonEventOnClickTest::CreateNativeNode)},
        ani_native_function {"commonAttrsFocusableTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CommonAttrsFocusableTest::CreateNativeNode)},
        ani_native_function {"commonAttrsEnabledTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CommonAttrsEnabledTest::CreateNativeNode)},
        ani_native_function {"testCommonAttrsDirection001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsDirection001)},
        ani_native_function {"testCommonAttrsDirection002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsDirection002)},
        ani_native_function {"testCommonAttrsDirection003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsDirection003)},
        ani_native_function {"testCommonAttrsDirection004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsDirection004)},
        ani_native_function {"testCommonAttrsDirection005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsDirection005)},    
        ani_native_function {"commonAttrsHitTestBehaviorTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CommonAttrsHitTestBehaviorTest::CreateNativeNode)},
        ani_native_function {"testCommonAttrsAlign001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign001)},
        ani_native_function {"testCommonAttrsAlign002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign002)},
        ani_native_function {"testCommonAttrsAlign003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign003)},
        ani_native_function {"testCommonAttrsAlign004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign004)},
        ani_native_function {"testCommonAttrsAlign005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign005)},
        ani_native_function {"testCommonAttrsAlign006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign006)},
        ani_native_function {"testCommonAttrsAlign007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign007)},
        ani_native_function {"testCommonAttrsAlign008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign008)},
        ani_native_function {"testCommonAttrsAlign009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign009)},
        ani_native_function {"testCommonAttrsAlign010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign010)},
        ani_native_function {"testCommonAttrsAlign011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign011)},
        ani_native_function {"testCommonAttrsAlign012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign012)},
        ani_native_function {"testCommonAttrsAlign013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign013)},
        ani_native_function {"testCommonAttrsAlign014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign014)},
        ani_native_function {"testCommonAttrsAlign015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign015)},
        ani_native_function {"testCommonAttrsAlign016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign016)},
        ani_native_function {"testCommonAttrsAlign017", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign017)},
        ani_native_function {"testCommonAttrsAlign018", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign018)},
        ani_native_function {"testCommonAttrsAlign019", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign019)},
        ani_native_function {"testCommonAttrsAlign020", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign020)},
        ani_native_function {"testCommonAttrsAlign021", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign021)},
        ani_native_function {"testCommonAttrsAlign022", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign022)},
        ani_native_function {"testCommonAttrsAlign023", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign023)},
        ani_native_function {"testCommonAttrsAlign024", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign024)},
        ani_native_function {"testCommonAttrsAlign025", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign025)},
        ani_native_function {"testCommonAttrsAlign026", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign026)},
        ani_native_function {"testCommonAttrsAlign027", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign027)},
        ani_native_function {"testCommonAttrsAlign028", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign028)},
        ani_native_function {"testCommonAttrsAlign029", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign029)},
        ani_native_function {"testCommonAttrsAlign030", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign030)},
        ani_native_function {"testCommonAttrsAlign031", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign031)},
        ani_native_function {"testCommonAttrsAlign032", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign032)},
        ani_native_function {"testCommonAttrsAlign033", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign033)},
        ani_native_function {"testCommonAttrsAlign034", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign034)},
        ani_native_function {"testCommonAttrsAlign035", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign035)},
        ani_native_function {"testCommonAttrsAlign036", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign036)},
        ani_native_function {"testCommonAttrsAlign037", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign037)},
        ani_native_function {"testCommonAttrsAlign038", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign038)},
        ani_native_function {"testCommonAttrsAlign039", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign039)},
        ani_native_function {"testCommonAttrsAlign040", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign040)},
        ani_native_function {"testCommonAttrsAlign041", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign041)},
        ani_native_function {"testCommonAttrsAlign042", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign042)},
        ani_native_function {"testCommonAttrsAlign043", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlign043)},
        ani_native_function {"testColumnAlignItems001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnAlignItems001)},
        ani_native_function {"testColumnAlignItems002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnAlignItems002)},
        ani_native_function {"testColumnAlignItems003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnAlignItems003)},
        ani_native_function {"testColumnAlignItems004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnAlignItems004)},
        ani_native_function {"testColumnForegroundBlurStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle001)},
        ani_native_function {"testColumnForegroundBlurStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle002)},
        ani_native_function {"testColumnForegroundBlurStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle003)},
        ani_native_function {"testColumnForegroundBlurStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle004)},
        ani_native_function {"testColumnForegroundBlurStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle005)},
        ani_native_function {"testColumnForegroundBlurStyle006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle006)},
        ani_native_function {"testColumnForegroundBlurStyle007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle007)},
        ani_native_function {"testColumnForegroundBlurStyle008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle008)},
        ani_native_function {"testColumnForegroundBlurStyle009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle009)},
        ani_native_function {"testColumnForegroundBlurStyle010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle010)},
        ani_native_function {"testColumnForegroundBlurStyle011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle011)},
        ani_native_function {"testColumnForegroundBlurStyle012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle012)},
        ani_native_function {"testColumnForegroundBlurStyle013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle013)},
        ani_native_function {"testColumnForegroundBlurStyle014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle014)},
        ani_native_function {"testColumnForegroundBlurStyle015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle015)},
        ani_native_function {"testColumnForegroundBlurStyle016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle016)},
        ani_native_function {"testColumnForegroundBlurStyle017", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle017)},
        ani_native_function {"testColumnForegroundBlurStyle018", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle018)},
        ani_native_function {"testColumnForegroundBlurStyle019", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle019)},
        ani_native_function {"testColumnForegroundBlurStyle020", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle020)},
        ani_native_function {"testColumnForegroundBlurStyle021", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle021)},
        ani_native_function {"testColumnForegroundBlurStyle022", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle022)},
        ani_native_function {"testColumnForegroundBlurStyle023", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle023)},
        ani_native_function {"testColumnForegroundBlurStyle024", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle024)},
        ani_native_function {"testColumnForegroundBlurStyle025", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle025)},
        ani_native_function {"testColumnForegroundBlurStyle026", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle026)},
        ani_native_function {"testColumnForegroundBlurStyle027", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle027)},
        ani_native_function {"testColumnForegroundBlurStyle028", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle028)},
        ani_native_function {"testColumnForegroundBlurStyle029", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle029)},
        ani_native_function {"testColumnForegroundBlurStyle030", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle030)},
        ani_native_function {"testColumnForegroundBlurStyle031", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle031)},
        ani_native_function {"testColumnForegroundBlurStyle032", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnForegroundBlurStyle032)},      
        ani_native_function {"testColumnPadding001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnPadding001)},
        ani_native_function {"testColumnPadding002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnPadding002)},
        ani_native_function {"testColumnPadding003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnPadding003)},
        ani_native_function {"testColumnPadding004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnPadding004)},
        ani_native_function {"testColumnJustifyContent001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnJustifyContent001)},
        ani_native_function {"testColumnJustifyContent002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnJustifyContent002)},
        ani_native_function {"testColumnJustifyContent003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnJustifyContent003)},
        ani_native_function {"testColumnJustifyContent004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnJustifyContent004)},
        ani_native_function {"testColumnJustifyContent005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnJustifyContent005)},
        ani_native_function {"testColumnJustifyContent006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnJustifyContent006)},
        ani_native_function {"testColumnJustifyContent007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnJustifyContent007)},    
        ani_native_function {"testSliderHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderHeight001)},
        ani_native_function {"testSliderHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderHeight002)},
        ani_native_function {"testSliderHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderHeight003)},
        ani_native_function {"testSliderWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderWidth001)},
        ani_native_function {"testSliderWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderWidth002)},
        ani_native_function {"testSliderWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderWidth003)},      
        ani_native_function {"testRowHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowHeight001)},
        ani_native_function {"testRowHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowHeight002)},
        ani_native_function {"testRowHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowHeight003)},
        ani_native_function {"testRowAlignItems001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowAlignItems001)},
        ani_native_function {"testRowAlignItems002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowAlignItems002)},
        ani_native_function {"testRowAlignItems003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowAlignItems003)},
        ani_native_function {"testRowAlignItems004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowAlignItems004)},    
        ani_native_function {"testRowJustifyContent001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowJustifyContent001)},
        ani_native_function {"testRowJustifyContent002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowJustifyContent002)},
        ani_native_function {"testRowJustifyContent003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowJustifyContent003)},
        ani_native_function {"testRowJustifyContent004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowJustifyContent004)},
        ani_native_function {"testRowJustifyContent005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowJustifyContent005)},
        ani_native_function {"testRowJustifyContent006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowJustifyContent006)},
        ani_native_function {"testRowJustifyContent007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRowJustifyContent007)},     
        ani_native_function {"testColumnHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnHeight001)},
        ani_native_function {"testColumnHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnHeight002)},
        ani_native_function {"testColumnHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnHeight003)},
        ani_native_function {"testColumnWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnWidth001)},
        ani_native_function {"testColumnWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnWidth002)},
        ani_native_function {"testColumnWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestColumnWidth003)},    
        ani_native_function {"testFlexHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexHeight001)},
        ani_native_function {"testFlexHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexHeight002)},
        ani_native_function {"testFlexHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexHeight003)},
        ani_native_function {"testFlexWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexWidth001)},
        ani_native_function {"testFlexWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexWidth002)},
        ani_native_function {"testFlexWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexWidth003)},
        ani_native_function {"testFlexOption001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption001)},
        ani_native_function {"testFlexOption002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption002)},
        ani_native_function {"testFlexOption003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption003)},
        ani_native_function {"testFlexOption004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption004)},
        ani_native_function {"testFlexOption005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption005)},
        ani_native_function {"testFlexOption006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption006)},
        ani_native_function {"testFlexOption007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption007)},
        ani_native_function {"testFlexOption008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption008)},
        ani_native_function {"testFlexOption009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption009)},
        ani_native_function {"testFlexOption010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption010)},
        ani_native_function {"testFlexOption011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption011)},
        ani_native_function {"testFlexOption012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption012)},
        ani_native_function {"testFlexOption013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption013)},
        ani_native_function {"testFlexOption014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption014)},
        ani_native_function {"testFlexOption015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption015)},
        ani_native_function {"testFlexOption016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption016)},
        ani_native_function {"testFlexOption017", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption017)},
        ani_native_function {"testFlexOption018", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption018)},
        ani_native_function {"testFlexOption019", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption019)},
        ani_native_function {"testFlexOption020", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption020)},
        ani_native_function {"testFlexOption021", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption021)},
        ani_native_function {"testFlexOption022", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption022)},
        ani_native_function {"testFlexOption023", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestFlexOption023)},    
        ani_native_function {"testCheckboxHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxHeight001)},
        ani_native_function {"testCheckboxHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxHeight002)},
        ani_native_function {"testCheckboxHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxHeight003)},    
        ani_native_function {"testCheckboxWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxWidth001)},
        ani_native_function {"testCheckboxWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxWidth002)},
        ani_native_function {"testCheckboxWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxWidth003)},    
        ani_native_function {"testSpanContent001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanContent001)},
        ani_native_function {"testSpanContent002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanContent002)},       
        ani_native_function {"testSpanFontColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontColor001)},
        ani_native_function {"testSpanFontColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontColor002)},
        ani_native_function {"testSpanFontColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontColor003)},
        ani_native_function {"testSpanFontSize001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontSize001)},
        ani_native_function {"testSpanFontSize002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontSize002)},
        ani_native_function {"testSpanFontSize003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontSize003)},
        ani_native_function {"testSpanFontStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontStyle001)},
        ani_native_function {"testSpanFontStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontStyle002)},
        ani_native_function {"testSpanFontStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontStyle003)},
        ani_native_function {"testSpanFontWeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight001)},
        ani_native_function {"testSpanFontWeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight002)},
        ani_native_function {"testSpanFontWeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight003)},
        ani_native_function {"testSpanFontWeight004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight004)},
        ani_native_function {"testSpanFontWeight005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight005)},
        ani_native_function {"testSpanFontWeight006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight006)},
        ani_native_function {"testSpanFontWeight007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight007)},
        ani_native_function {"testSpanFontWeight008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight008)},
        ani_native_function {"testSpanFontWeight009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight009)},
        ani_native_function {"testSpanFontWeight010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight010)},
        ani_native_function {"testSpanFontWeight011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight011)},
        ani_native_function {"testSpanFontWeight012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight012)},
        ani_native_function {"testSpanFontWeight013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight013)},
        ani_native_function {"testSpanFontWeight014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight014)},
        ani_native_function {"testSpanFontWeight015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight015)},
        ani_native_function {"testSpanFontWeight016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanFontWeight016)},    
        ani_native_function {"testSpanLineHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanLineHeight001)},
        ani_native_function {"testSpanLineHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanLineHeight002)},
        ani_native_function {"testSpanLineHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanLineHeight003)},    
        ani_native_function {"testSpanLetterSpacing001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanLetterSpacing001)},
        ani_native_function {"testSpanLetterSpacing002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanLetterSpacing002)},
        ani_native_function {"testSpanLetterSpacing003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanLetterSpacing003)},    
        ani_native_function {"testSpanTextCase001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanTextCase001)},
        ani_native_function {"testSpanTextCase002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanTextCase002)},
        ani_native_function {"testSpanTextCase003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanTextCase003)},
        ani_native_function {"testSpanTextCase004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanTextCase004)},    
        ani_native_function {"testSpanDecoration001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration001)},
        ani_native_function {"testSpanDecoration002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration002)},
        ani_native_function {"testSpanDecoration003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration003)},
        ani_native_function {"testSpanDecoration004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration004)},
        ani_native_function {"testSpanDecoration005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration005)},   
        ani_native_function {"testSpanDecoration006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration006)},
        ani_native_function {"testSpanDecoration007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration007)},
        ani_native_function {"testSpanDecoration008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration008)},
        ani_native_function {"testSpanDecoration009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration009)},
        ani_native_function {"testSpanDecoration010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration010)},
        ani_native_function {"testSpanDecoration011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration011)},
        ani_native_function {"testSpanDecoration012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSpanDecoration012)},  
        ani_native_function {"testImageSpanPadding001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanPadding001)},
        ani_native_function {"testImageSpanPadding002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanPadding002)},
        ani_native_function {"testImageSpanPadding003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanPadding003)},
        ani_native_function {"testImageSpanPadding004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanPadding004)},    
        ani_native_function {"testImageSpanVerticalAlign001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanVerticalAlign001)},
        ani_native_function {"testImageSpanVerticalAlign002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanVerticalAlign002)},
        ani_native_function {"testImageSpanVerticalAlign003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanVerticalAlign003)},
        ani_native_function {"testImageSpanVerticalAlign004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanVerticalAlign004)},
        ani_native_function {"testImageSpanVerticalAlign005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanVerticalAlign005)},    
        ani_native_function {"testImageSpanObjectFit001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanObjectFit001)},
        ani_native_function {"testImageSpanObjectFit002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanObjectFit002)},
        ani_native_function {"testImageSpanObjectFit003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanObjectFit003)},
        ani_native_function {"testImageSpanObjectFit004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanObjectFit004)},
        ani_native_function {"testImageSpanObjectFit005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanObjectFit005)},
        ani_native_function {"testImageSpanObjectFit006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanObjectFit006)},
        ani_native_function {"testImageSpanObjectFit007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanObjectFit007)},    
        ani_native_function {"testImageSpanHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanHeight001)},
        ani_native_function {"testImageSpanHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanHeight002)},
        ani_native_function {"testImageSpanHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanHeight003)},    
        ani_native_function {"testImageSpanWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanWidth001)},
        ani_native_function {"testImageSpanWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanWidth002)},
        ani_native_function {"testImageSpanWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSpanWidth003)},    
        ani_native_function {"testCustomDialogCustomStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogCustomStyle001)},
        ani_native_function {"testCustomDialogCustomStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogCustomStyle002)},      
        ani_native_function {"testCustomDialogAlignment001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogAlignment001)},
        ani_native_function {"testCustomDialogAlignment002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogAlignment002)},
        ani_native_function {"testCustomDialogAlignment003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogAlignment003)},
        ani_native_function {"testCustomDialogAlignment004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogAlignment004)},
        ani_native_function {"testCustomDialogAlignment005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogAlignment005)},
        ani_native_function {"testCustomDialogAlignment006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogAlignment006)},
        ani_native_function {"testCustomDialogAlignment007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogAlignment007)},
        ani_native_function {"testCustomDialogAlignment008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogAlignment008)},
        ani_native_function {"testCustomDialogAlignment009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogAlignment009)},
        ani_native_function {"testCustomDialogAlignment010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogAlignment010)},    
        ani_native_function {"testCustomDialogClose001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogClose001)},
        ani_native_function {"testCustomDialogClose002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogClose002)},    
        ani_native_function {"testCustomDialogOpen001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogOpen001)},
        ani_native_function {"testCustomDialogOpen002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogOpen002)},    
        ani_native_function {"testScrollPageEnable001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollPageEnable001)},
        ani_native_function {"testScrollPageEnable002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollPageEnable002)},
        ani_native_function {"testScrollPageEnable003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollPageEnable003)},
        ani_native_function {"testScrollPageEnable004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollPageEnable004)},
        ani_native_function {"testScrollPageEnable005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollPageEnable005)},    
        ani_native_function {"testScrollSaturate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollSaturate001)},
        ani_native_function {"testScrollSaturate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollSaturate002)},
        ani_native_function {"testScrollSaturate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollSaturate003)},
        ani_native_function {"testScrollSaturate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollSaturate004)},
        ani_native_function {"testScrollSaturate005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollSaturate005)},
        ani_native_function {"testScrollSaturate006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollSaturate006)},    
        ani_native_function {"testScrollLinearGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollLinearGradient001)},
        ani_native_function {"testScrollLinearGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollLinearGradient002)},
        ani_native_function {"testScrollLinearGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollLinearGradient003)},
        ani_native_function {"testScrollLinearGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollLinearGradient004)},
        ani_native_function {"testScrollLinearGradient005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollLinearGradient005)},
        ani_native_function {"testScrollLinearGradient006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollLinearGradient006)},
        ani_native_function {"testScrollLinearGradient007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollLinearGradient007)},
        ani_native_function {"testScrollLinearGradient008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollLinearGradient008)},
        ani_native_function {"testScrollLinearGradient009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollLinearGradient009)},   
        ani_native_function {"testScrollLinearGradient010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollLinearGradient010)},
        ani_native_function {"testScrollOverlay001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOverlay001)},
        ani_native_function {"testScrollOverlay002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOverlay002)},
        ani_native_function {"testScrollOverlay003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOverlay003)},
        ani_native_function {"testScrollOverlay004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOverlay004)},
        ani_native_function {"testScrollOverlay005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOverlay005)},
        ani_native_function {"testScrollOverlay006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOverlay006)},
        ani_native_function {"testScrollOverlay007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOverlay007)},
        ani_native_function {"testScrollOverlay008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOverlay008)},
        ani_native_function {"testScrollOverlay009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOverlay009)},    
        ani_native_function {"testScrollScrollSnap001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollSnap001)},
        ani_native_function {"testScrollScrollSnap002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollSnap002)},
        ani_native_function {"testScrollScrollSnap003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollSnap003)},
        ani_native_function {"testScrollScrollSnap004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollSnap004)},    
        ani_native_function {"testScrollFriction001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollFriction001)},
        ani_native_function {"testScrollFriction002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollFriction001)},    
        ani_native_function {"testScrollEdgeEffect001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollEdgeEffect001)},
        ani_native_function {"testScrollEdgeEffect002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollEdgeEffect002)},
        ani_native_function {"testScrollEdgeEffect003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollEdgeEffect003)},    
        ani_native_function {"testScrollBlur001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBlur001)},
        ani_native_function {"testScrollBlur002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBlur002)},
        ani_native_function {"testScrollBlur003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBlur003)},    
        ani_native_function {"testScrollBrightness001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBrightness001)},
        ani_native_function {"testScrollBrightness002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBrightness002)},
        ani_native_function {"testScrollBrightness003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBrightness003)},    
        ani_native_function {"testScrollRotate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollRotate001)},
        ani_native_function {"testScrollRotate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollRotate002)},    
        ani_native_function {"testScrollScale001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScale001)},
        ani_native_function {"testScrollScale002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScale002)},
        ani_native_function {"testScrollScale003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScale003)},    
        ani_native_function {"testScrollTranslate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollTranslate001)},
        ani_native_function {"testScrollTranslate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollTranslate002)},
        ani_native_function {"testScrollTranslate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollTranslate003)},
        ani_native_function {"testScrollTranslate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollTranslate004)},    
        ani_native_function {"testScrollOpacity001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOpacity001)},
        ani_native_function {"testScrollOpacity002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOpacity002)},
        ani_native_function {"testScrollOpacity003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOpacity003)},
        ani_native_function {"testScrollOpacity004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollOpacity004)},    
        ani_native_function {"testScrollScrollAble001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollAble001)},
        ani_native_function {"testScrollScrollAble002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollAble002)},
        ani_native_function {"testScrollScrollAble003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollAble003)},
        ani_native_function {"testScrollScrollAble004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollAble004)},    
        ani_native_function {"testScrollBorderRadius001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBorderRadius001)},
        ani_native_function {"testScrollBorderRadius002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBorderRadius002)},
        ani_native_function {"testScrollBorderRadius003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBorderRadius003)},    
        ani_native_function {"testScrollBorderColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBorderColor001)},
        ani_native_function {"testScrollBorderColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBorderColor002)},    
        ani_native_function {"TestScrollBorderWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBorderWidth001)},
        ani_native_function {"testScrollBorderWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBorderWidth002)},
        ani_native_function {"testScrollBorderWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBorderWidth003)},      
        ani_native_function {"testScrollBackgroundColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBackgroundColor001)},
        ani_native_function {"testScrollBackgroundColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBackgroundColor002)},
        ani_native_function {"testScrollBackgroundColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBackgroundColor003)},    
        ani_native_function {"testScrollClip001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollClip001)},
        ani_native_function {"testScrollClip002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollClip002)},
        ani_native_function {"testScrollClip003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollClip003)},    
        ani_native_function {"testScrollEnableScrollInteraction001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollEnableScrollInteraction001)},
        ani_native_function {"testScrollEnableScrollInteraction002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollEnableScrollInteraction002)},
        ani_native_function {"testScrollEnableScrollInteraction003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollEnableScrollInteraction003)},    
        ani_native_function {"testScrollScrollBarColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollBarColor001)},
        ani_native_function {"testScrollScrollBarColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollBarColor002)},
        ani_native_function {"testScrollScrollBarColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollBarColor003)},    
        ani_native_function {"testScrollScrollBar001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollBar001)},
        ani_native_function {"testScrollScrollBar002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollBar002)},
        ani_native_function {"testScrollScrollBar003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollBar003)},
        ani_native_function {"testScrollScrollBar004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollScrollBar004)},    
        ani_native_function {"testImagePosition001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImagePosition001)},
        ani_native_function {"testImagePosition002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImagePosition002)},    
        ani_native_function {"testImageHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageHeight001)},
        ani_native_function {"testImageHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageHeight002)},
        ani_native_function {"testImageHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageHeight003)},    
        ani_native_function {"testImageWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageWidth001)},
        ani_native_function {"testImageWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageWidth002)},
        ani_native_function {"testImageWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageWidth003)},    
        ani_native_function {"testScrollHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollHeight001)},
        ani_native_function {"testScrollHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollHeight002)},
        ani_native_function {"testScrollHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollHeight003)},
        ani_native_function {"testScrollWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollWidth001)},
        ani_native_function {"testScrollWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollWidth002)},
        ani_native_function {"testScrollWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollWidth003)},
        ani_native_function {"testScrollPosition001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollPosition001)},
        ani_native_function {"testScrollPosition002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollPosition002)},     
        ani_native_function {"testListItemSaturate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemSaturate001)},
        ani_native_function {"testListItemSaturate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemSaturate002)},
        ani_native_function {"testListItemSaturate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemSaturate003)},
        ani_native_function {"testListItemSaturate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemSaturate004)},
        ani_native_function {"testListItemSaturate005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemSaturate005)},
        ani_native_function {"testListItemSaturate006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemSaturate006)},
        ani_native_function {"testListItemSaturate007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemSaturate007)},    
        ani_native_function {"testListItemRotate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemRotate001)},
        ani_native_function {"testListItemRotate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemRotate002)},
        ani_native_function {"testListItemRotate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemRotate003)},
        ani_native_function {"testListItemRotate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemRotate004)},
        ani_native_function {"testListItemRotate005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemRotate005)},    
        ani_native_function {"testListItemTranslate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemTranslate001)},
        ani_native_function {"testListItemTranslate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemTranslate002)},
        ani_native_function {"testListItemTranslate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemTranslate003)},
        ani_native_function {"testListItemTranslate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemTranslate004)},
        ani_native_function {"testListItemTranslate005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemTranslate005)},
        ani_native_function {"testListItemTranslate006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemTranslate006)},    
        ani_native_function {"testListItemScale001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemScale001)},
        ani_native_function {"testListItemScale002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemScale002)},
        ani_native_function {"testListItemScale003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemScale003)},
        ani_native_function {"testListItemScale004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemScale004)},
        ani_native_function {"testListItemScale005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemScale005)},    
        ani_native_function {"testListItemBrightness001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBrightness001)},
        ani_native_function {"testListItemBrightness002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBrightness002)},
        ani_native_function {"testListItemBrightness003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBrightness003)},
        ani_native_function {"testListItemBrightness004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBrightness004)},    
        ani_native_function {"testListItemBlur001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBlur001)},
        ani_native_function {"testListItemBlur002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBlur002)},    
        ani_native_function {"testListItemLinearGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemLinearGradient001)},
        ani_native_function {"testListItemLinearGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemLinearGradient002)},
        ani_native_function {"testListItemLinearGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemLinearGradient003)},
        ani_native_function {"testListItemLinearGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemLinearGradient004)},
        ani_native_function {"testListItemLinearGradient005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemLinearGradient005)},
        ani_native_function {"testListItemLinearGradient006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemLinearGradient006)},
        ani_native_function {"testListItemLinearGradient007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemLinearGradient007)},
        ani_native_function {"testListItemLinearGradient008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemLinearGradient008)},
        ani_native_function {"testListItemLinearGradient009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemLinearGradient009)},
        ani_native_function {"testListItemLinearGradient010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemLinearGradient010)},    
        ani_native_function {"testListItemHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemHeight001)},
        ani_native_function {"testListItemHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemHeight002)},
        ani_native_function {"testListItemHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemHeight003)},    
        ani_native_function {"testListItemWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemWidth001)},
        ani_native_function {"testListItemWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemWidth002)},
        ani_native_function {"testListItemWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemWidth003)},    
        ani_native_function {"testListItemBackgroundColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBackgroundColor001)},
        ani_native_function {"testListItemBorderWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderWidth001)},
        ani_native_function {"testListItemBorderWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderWidth002)},
        ani_native_function {"testListItemBorderWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderWidth003)},
        ani_native_function {"testListItemBorderWidth004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderWidth004)},
        ani_native_function {"testListItemBorderWidth005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderWidth005)},    
        ani_native_function {"testListItemBorderColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderColor001)},
        ani_native_function {"testListItemBorderColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderColor002)},
        ani_native_function {"testListItemBorderColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderColor003)},    
        ani_native_function {"testListItemBorderRadius001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderRadius001)},
        ani_native_function {"testListItemBorderRadius002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderRadius002)},
        ani_native_function {"testListItemBorderRadius003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderRadius003)},
        ani_native_function {"testListItemBorderRadius004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderRadius004)},
        ani_native_function {"testListItemBorderRadius005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemBorderRadius005)},    
        ani_native_function {"testListItemOpacity001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemOpacity001)},
        ani_native_function {"testListItemOpacity002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemOpacity002)},
        ani_native_function {"testListItemOpacity003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemOpacity003)},
        ani_native_function {"testListItemOpacity004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemOpacity004)},    
        ani_native_function {"testListItemClip001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemClip001)},
        ani_native_function {"testListItemClip002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemClip002)},
        ani_native_function {"testListItemClip003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemClip003)},
        ani_native_function {"testListItemClip004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemClip004)},
        ani_native_function {"testListItemClip005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemClip005)},
        ani_native_function {"testListItemClip006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemClip006)},
        ani_native_function {"testListItemClip007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemClip007)},      
        ani_native_function {"testListNodeAdapterEvent001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListNodeAdapterEvent001)},
        ani_native_function {"testListNodeAdapter001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListNodeAdapter001)},
        ani_native_function {"testListNodeAdapter002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListNodeAdapter002)},
        ani_native_function {"testListNodeAdapter003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListNodeAdapter003)},    
        ani_native_function {"testListEnableScrollInteraction001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListEnableScrollInteraction001)},
        ani_native_function {"testListEnableScrollInteraction002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListEnableScrollInteraction002)},
        ani_native_function {"testListEnableScrollInteraction003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListEnableScrollInteraction003)},    
        ani_native_function {"testListEdgeEffect001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListEdgeEffect001)},
        ani_native_function {"testListEdgeEffect002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListEdgeEffect002)},
        ani_native_function {"testListEdgeEffect003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListEdgeEffect003)},    
        ani_native_function {"testListLinearGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListLinearGradient001)},
        ani_native_function {"testListLinearGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListLinearGradient002)},
        ani_native_function {"testListLinearGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListLinearGradient003)},
        ani_native_function {"testListLinearGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListLinearGradient004)},
        ani_native_function {"testListLinearGradient005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListLinearGradient005)},
        ani_native_function {"testListLinearGradient006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListLinearGradient006)},
        ani_native_function {"testListLinearGradient007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListLinearGradient007)},
        ani_native_function {"testListLinearGradient008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListLinearGradient008)},
        ani_native_function {"testListLinearGradient009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListLinearGradient009)},
        ani_native_function {"testListLinearGradient010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListLinearGradient010)},    
        ani_native_function {"testListListDirection001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListListDirection001)},
        ani_native_function {"testListListDirection002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListListDirection002)},
        ani_native_function {"testListListDirection003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListListDirection003)},
        ani_native_function {"testListListDirection004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListListDirection004)},    
        ani_native_function {"testListSticky001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSticky001)},
        ani_native_function {"testListSticky002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSticky002)},
        ani_native_function {"testListSticky003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSticky003)},
        ani_native_function {"testListSticky004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSticky004)},
        ani_native_function {"testListSticky005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSticky005)},    
        ani_native_function {"testListFriction001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListFriction001)},
        ani_native_function {"testListFriction002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListFriction002)},    
        ani_native_function {"testListCachedCount001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListCachedCount001)},
        ani_native_function {"testListCachedCount002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListCachedCount002)},    
        ani_native_function {"testListScrollBar001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScrollBar001)},
        ani_native_function {"testListScrollBar002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScrollBar002)},
        ani_native_function {"testListScrollBar003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScrollBar003)},
        ani_native_function {"testListScrollBar004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScrollBar004)},    
        ani_native_function {"testListBlur001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBlur001)},
        ani_native_function {"testListBlur002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBlur002)},    
        ani_native_function {"testListSaturate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSaturate001)},
        ani_native_function {"testListSaturate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSaturate002)},
        ani_native_function {"testListSaturate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSaturate003)},
        ani_native_function {"testListSaturate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSaturate004)},
        ani_native_function {"testListSaturate005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSaturate005)},
        ani_native_function {"testListSaturate006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSaturate006)},
        ani_native_function {"testListSaturate007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSaturate007)},    
        ani_native_function {"testListRotate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListRotate001)},
        ani_native_function {"testListRotate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListRotate002)},
        ani_native_function {"testListRotate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListRotate003)},
        ani_native_function {"testListRotate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListRotate004)},
        ani_native_function {"testListRotate005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListRotate005)},    
        ani_native_function {"testListBrightness001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBrightness001)},
        ani_native_function {"testListBrightness002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBrightness002)},
        ani_native_function {"testListBrightness003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBrightness003)},
        ani_native_function {"testListBrightness004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBrightness004)},    
        ani_native_function {"testListScale001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScale001)},
        ani_native_function {"testListScale002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScale002)},
        ani_native_function {"testListScale003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScale003)},
        ani_native_function {"testListScale004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScale004)},
        ani_native_function {"testListScale005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScale005)},    
        ani_native_function {"testListTranslate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListTranslate001)},
        ani_native_function {"testListTranslate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListTranslate002)},
        ani_native_function {"testListTranslate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListTranslate003)},
        ani_native_function {"testListTranslate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListTranslate004)},
        ani_native_function {"testListTranslate005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListTranslate005)},
        ani_native_function {"testListTranslate006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListTranslate006)},    
        ani_native_function {"testListClip001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListClip001)},
        ani_native_function {"testListClip002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListClip002)},
        ani_native_function {"testListClip003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListClip003)},
        ani_native_function {"testListClip004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListClip004)},
        ani_native_function {"testListClip005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListClip005)},
        ani_native_function {"testListClip006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListClip006)},
        ani_native_function {"testListClip007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListClip007)},     
        ani_native_function {"testListOpacity001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListOpacity001)},
        ani_native_function {"testListOpacity002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListOpacity002)},
        ani_native_function {"testListOpacity003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListOpacity003)},
        ani_native_function {"testListOpacity004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListOpacity004)},    
        ani_native_function {"testListBorderRadius001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderRadius001)},
        ani_native_function {"testListBorderRadius002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderRadius002)},
        ani_native_function {"testListBorderRadius003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderRadius003)},
        ani_native_function {"testListBorderRadius004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderRadius004)},
        ani_native_function {"testListBorderRadius005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderRadius005)},    
        ani_native_function {"testListBorderColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderColor001)},
        ani_native_function {"testListBorderColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderColor002)},
        ani_native_function {"testListBorderColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderColor003)},    
        ani_native_function {"testListBorderWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderWidth001)},
        ani_native_function {"testListBorderWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderWidth002)},
        ani_native_function {"testListBorderWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderWidth003)},
        ani_native_function {"testListBorderWidth004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderWidth004)},
        ani_native_function {"testListBorderWidth005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBorderWidth005)},    
        ani_native_function {"testListBackgroundColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListBackgroundColor001)},
        ani_native_function {"testImageAniMator009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageAniMator009)},
        ani_native_function {"testImageAniMator010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageAniMator010)},
        ani_native_function {"testImageAniMator011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageAniMator011)},    
        ani_native_function {"testAccessibility070", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAccessibility070)},
        ani_native_function {"testAccessibility080", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAccessibility080)},
        ani_native_function {"testAccessibility090", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAccessibility090)},
        ani_native_function {"testAccessibility010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAccessibility010)},
        ani_native_function {"testAccessibility011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestAccessibility011)},     
        ani_native_function {"testNodeUtils010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeUtils010)},
        ani_native_function {"testNodeUtils020", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeUtils020)},
        ani_native_function {"testNodeUtils030", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeUtils030)},
        ani_native_function {"testNodeUtils040", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeUtils040)},
        ani_native_function {"testNodeUtils050", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeUtils050)},
        ani_native_function {"testNodeUtils060", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestNodeUtils060)},    
        ani_native_function {"testListChildMainSize001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListChildMainSize001)},
        ani_native_function {"testListChildMainSize002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListChildMainSize002)},
        ani_native_function {"testListChildMainSize003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListChildMainSize003)},
        ani_native_function {"testListChildMainSize004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListChildMainSize004)},
        ani_native_function {"testListChildMainSize005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListChildMainSize005)},
        ani_native_function {"testListChildMainSize006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListChildMainSize006)},
        ani_native_function {"testListSwipeOption007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSwipeOption007)},
        ani_native_function {"testListSwipeOption008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListSwipeOption008)},      
        ani_native_function {"testListWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListWidth001)},
        ani_native_function {"testListWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListWidth002)},
        ani_native_function {"testListWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListWidth003)},    
        ani_native_function {"testListHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListHeight001)},
        ani_native_function {"testListHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListHeight002)},
        ani_native_function {"testListHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListHeight003)},    
        ani_native_function {"testImageClip001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageClip001)},
        ani_native_function {"testImageClip002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageClip002)},
        ani_native_function {"testImageClip003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageClip003)},
        ani_native_function {"testImageClip004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageClip004)},
        ani_native_function {"testImageClip005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageClip005)},
        ani_native_function {"testImageClip006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageClip006)},
        ani_native_function {"testImageClip007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageClip007)},    
        ani_native_function {"testImageSrc001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSrc001)},
        ani_native_function {"testImageSrc002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSrc002)},
        ani_native_function {"testImageSrc003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSrc003)},
        ani_native_function {"testImageSrc004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSrc004)},
        ani_native_function {"testImageSrc005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSrc005)},      
        ani_native_function {"testImageBackgroundColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBackgroundColor001)},
        ani_native_function {"testImageBackgroundColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBackgroundColor002)},
        ani_native_function {"testImageBlur001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBlur001)},
        ani_native_function {"testImageBlur002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBlur002)},
        ani_native_function {"testImageBlur003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBlur003)},
        ani_native_function {"testImageBorderColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderColor001)},
        ani_native_function {"testImageBorderColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderColor002)},
        ani_native_function {"testImageBorderColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderColor003)},
        ani_native_function {"testImageBorderColor004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderColor004)},
        ani_native_function {"testImageBorderRadius001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderRadius001)},
        ani_native_function {"testImageBorderRadius002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderRadius002)},
        ani_native_function {"testImageBorderRadius003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderRadius003)},
        ani_native_function {"testImageBorderRadius004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderRadius004)},
        ani_native_function {"testImageBorderRadius005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderRadius005)},
        ani_native_function {"testImageBorderRadius006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderRadius006)},
        ani_native_function {"testImageBorderRadius007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderRadius007)},
        ani_native_function {"testImageBorderRadius008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderRadius008)},
        ani_native_function {"testImageBorderStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderStyle001)},
        ani_native_function {"testImageBorderStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderStyle002)},
        ani_native_function {"testImageBorderStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderStyle003)},
        ani_native_function {"testImageBorderStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderStyle004)},
        ani_native_function {"testImageBorderStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderStyle005)},
        ani_native_function {"testImageBorderWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderWidth001)},
        ani_native_function {"testImageBorderWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderWidth002)},
        ani_native_function {"testImageBorderWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderWidth003)},
        ani_native_function {"testImageBorderWidth004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderWidth004)},
        ani_native_function {"testImageBorderWidth005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderWidth005)},
        ani_native_function {"testImageBorderWidth006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBorderWidth006)},
        ani_native_function {"testImageBrightness001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBrightness001)},
        ani_native_function {"testImageBrightness002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBrightness002)},
        ani_native_function {"testImageBrightness003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBrightness003)},
        ani_native_function {"testImageBrightness004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBrightness004)},
        ani_native_function {"testImageBrightness005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageBrightness005)},
        ani_native_function {"testImageColorFilter001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageColorFilter001)},
        ani_native_function {"testImageColorFilter002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageColorFilter002)},
        ani_native_function {"testImageInterpolation001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageInterpolation001)},
        ani_native_function {"testImageInterpolation002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageInterpolation002)},
        ani_native_function {"testImageInterpolation003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageInterpolation003)},
        ani_native_function {"testImageInterpolation004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageInterpolation004)},
        ani_native_function {"testImageInterpolation005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageInterpolation005)},
        ani_native_function {"testImageInterpolation006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageInterpolation006)},
        ani_native_function {"testImageLinearGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient001)},
        ani_native_function {"testImageLinearGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient002)},
        ani_native_function {"testImageLinearGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient003)},
        ani_native_function {"testImageLinearGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient004)},
        ani_native_function {"testImageLinearGradient005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient005)},
        ani_native_function {"testImageLinearGradient006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient006)},
        ani_native_function {"testImageLinearGradient007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient007)},
        ani_native_function {"testImageLinearGradient008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient008)},
        ani_native_function {"testImageLinearGradient009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient009)},
        ani_native_function {"testImageLinearGradient010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient010)},
        ani_native_function {"testImageLinearGradient011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient011)},
        ani_native_function {"testImageLinearGradient012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient012)},
        ani_native_function {"testImageLinearGradient013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient013)},
        ani_native_function {"testImageLinearGradient014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient014)},
        ani_native_function {"testImageLinearGradient015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient015)},
        ani_native_function {"testImageLinearGradient016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient016)},
        ani_native_function {"testImageLinearGradient017", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient017)},
        ani_native_function {"testImageLinearGradient018", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient018)},
        ani_native_function {"testImageLinearGradient019", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient019)},
        ani_native_function {"testImageLinearGradient020", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient020)},
        ani_native_function {"testImageLinearGradient021", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageLinearGradient021)},
        ani_native_function {"testImageObjectFit001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit001)},
        ani_native_function {"testImageObjectFit002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit002)},
        ani_native_function {"testImageObjectFit003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit003)},
        ani_native_function {"testImageObjectFit004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit004)},
        ani_native_function {"testImageObjectFit005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit005)},
        ani_native_function {"testImageObjectFit006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit006)},
        ani_native_function {"testImageObjectFit007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit007)},
        ani_native_function {"testImageObjectFit008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit008)},
        ani_native_function {"testImageObjectFit009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit009)},
        ani_native_function {"testImageObjectFit010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit010)},
        ani_native_function {"testImageObjectFit011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit011)},
        ani_native_function {"testImageObjectFit012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit012)},
        ani_native_function {"testImageObjectFit013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit013)},
        ani_native_function {"testImageObjectFit014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit014)},
        ani_native_function {"testImageObjectFit015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit015)},
        ani_native_function {"testImageObjectFit016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit016)},
        ani_native_function {"testImageObjectFit017", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit017)},
        ani_native_function {"testImageObjectFit018", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectFit018)},
        ani_native_function {"testImageObjectRepeat001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectRepeat001)},
        ani_native_function {"testImageObjectRepeat002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectRepeat002)},
        ani_native_function {"testImageObjectRepeat003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectRepeat003)},
        ani_native_function {"testImageObjectRepeat004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectRepeat004)},
        ani_native_function {"testImageObjectRepeat005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectRepeat005)},
        ani_native_function {"testImageObjectRepeat006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageObjectRepeat006)},
        ani_native_function {"testImageOpacity001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageOpacity001)},
        ani_native_function {"testImageOpacity002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageOpacity002)},
        ani_native_function {"testImageOpacity003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageOpacity003)},
        ani_native_function {"testImageOpacity004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageOpacity004)},
        ani_native_function {"testImageOpacity005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageOpacity005)},
        ani_native_function {"testImageOpacity006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageOpacity006)},
        ani_native_function {"testImageRadialGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageRadialGradient001)},
        ani_native_function {"testImageRadialGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageRadialGradient002)},
        ani_native_function {"testImageRadialGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageRadialGradient003)},
        ani_native_function {"testImageRadialGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageRadialGradient004)},
        ani_native_function {"testImageRadialGradient005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageRadialGradient005)},
        ani_native_function {"testImageRotate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageRotate001)},
        ani_native_function {"testImageRotate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageRotate002)},
        ani_native_function {"testImageRotate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageRotate003)},
        ani_native_function {"testImageRotate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageRotate004)},
        ani_native_function {"testImageSaturate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSaturate001)},
        ani_native_function {"testImageSaturate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSaturate002)},
        ani_native_function {"testImageSaturate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSaturate003)},
        ani_native_function {"testImageSaturate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSaturate004)},
        ani_native_function {"testImageSaturate005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSaturate005)},
        ani_native_function {"testImageSaturate006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSaturate006)},
        ani_native_function {"testImageSaturate007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSaturate007)},
        ani_native_function {"testImageScale001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageScale001)},
        ani_native_function {"testImageScale002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageScale002)},
        ani_native_function {"testImageScale003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageScale003)},
        ani_native_function {"testImageSweepGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSweepGradient001)},
        ani_native_function {"testImageSweepGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSweepGradient002)},
        ani_native_function {"testImageSweepGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSweepGradient003)},
        ani_native_function {"testImageSweepGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageSweepGradient004)},
        ani_native_function {"testImageTransform001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageTransform001)},
        ani_native_function {"testImageTransform002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageTransform002)},
        ani_native_function {"testImageTransform003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageTransform003)},
        ani_native_function {"testImageTransform004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageTransform004)},
        ani_native_function {"testImageTransform005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageTransform005)},
        ani_native_function {"testImageTranslate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageTranslate001)},
        ani_native_function {"testImageTranslate002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageTranslate002)},
        ani_native_function {"testImageTranslate003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageTranslate003)},
        ani_native_function {"testImageTranslate004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageTranslate004)},
        ani_native_function {"testImageTranslate005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageTranslate005)},      
        ani_native_function {"testImageAlt001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageAlt001)},
        ani_native_function {"testImageAutoResize001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageAutoResize001)},
        ani_native_function {"testImageAutoResize002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageAutoResize002)},
        ani_native_function {"testCommonAttrsInvert001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsInvert001)},
        ani_native_function {"testCommonAttrsInvert002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsInvert002)},
        ani_native_function {"testCommonAttrsInvert003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsInvert003)},
        ani_native_function {"testCommonAttrsInvert004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsInvert004)},
        ani_native_function {"testCommonAttrsInvert005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsInvert005)},
        ani_native_function {"testCommonAttrsInvert006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsInvert006)},
        ani_native_function {"testCommonAttrsOpacity001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsOpacity001)},
        ani_native_function {"testCommonAttrsOpacity002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsOpacity002)},
        ani_native_function {"testCommonAttrsOpacity003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsOpacity003)},
        ani_native_function {"testCommonAttrsOpacity004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsOpacity004)},
        ani_native_function {"testCommonAttrsOpacity005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsOpacity005)},
        ani_native_function {"testCommonAttrsOpacity006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsOpacity006)},
        ani_native_function {"testCommonAttrsSepia001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsSepia001)},
        ani_native_function {"testCommonAttrsSepia002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsSepia002)},
        ani_native_function {"testCommonAttrsSepia003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsSepia003)},
        ani_native_function {"testCommonAttrsSepia004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsSepia004)},
        ani_native_function {"testCommonAttrsSepia005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsSepia005)},
        ani_native_function {"testCommonAttrsSepia006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsSepia006)},     
        ani_native_function {"testCommonAttrsGrayscale001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsGrayscale001)},
        ani_native_function {"testCommonAttrsGrayscale002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsGrayscale002)},
        ani_native_function {"testCommonAttrsGrayscale003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsGrayscale003)},
        ani_native_function {"testCommonAttrsGrayscale004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsGrayscale004)},
        ani_native_function {"testCommonAttrsGrayscale005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsGrayscale005)},
        ani_native_function {"testCommonAttrsGrayscale006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsGrayscale006)},    
        ani_native_function {"testCommonAttrsContrast001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsContrast001)},
        ani_native_function {"testCommonAttrsContrast002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsContrast002)},
        ani_native_function {"testCommonAttrsContrast003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsContrast003)},
        ani_native_function {"testCommonAttrsContrast004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsContrast004)},
        ani_native_function {"testCommonAttrsContrast005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsContrast005)},
        ani_native_function {"testCommonAttrsContrast006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsContrast006)},    
        ani_native_function {"testCommonAttrsConstraintSize001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsConstraintSize001)},
        ani_native_function {"testCommonAttrsConstraintSize002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsConstraintSize002)},
        ani_native_function {"testCommonAttrsConstraintSize003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsConstraintSize003)},
        ani_native_function {"testCommonAttrsConstraintSize004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsConstraintSize004)},    
        ani_native_function {"testCommonAttrsMargin001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMargin001)},
        ani_native_function {"testCommonAttrsMargin002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMargin002)},
        ani_native_function {"testCommonAttrsMargin003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMargin003)},
        ani_native_function {"testCommonAttrsMargin004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMargin004)},    
        ani_native_function {"testCommonAttrsScale001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsScale001)},
        ani_native_function {"testCommonAttrsScale002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsScale002)},
        ani_native_function {"testCommonAttrsScale003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsScale003)},
        ani_native_function {"testCommonAttrsScale004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsScale004)},
        ani_native_function {"testCommonAttrsScale005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsScale005)},
        ani_native_function {"testCommonAttrsScale006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsScale006)},
        ani_native_function {"testCommonAttrsScale007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsScale007)},
        ani_native_function {"testCommonAttrsScale008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsScale008)},
        ani_native_function {"testCommonAttrsScale009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsScale009)},
        ani_native_function {"testCommonAttrsScale010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsScale010)},    
        ani_native_function {"testCommonAttrsLinearGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsLinearGradient001)},
        ani_native_function {"testCommonAttrsLinearGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsLinearGradient002)},
        ani_native_function {"testCommonAttrsLinearGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsLinearGradient003)},
        ani_native_function {"testCommonAttrsLinearGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsLinearGradient004)},
        ani_native_function {"testCommonAttrsLinearGradient005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsLinearGradient005)},
        ani_native_function {"testCommonAttrsLinearGradient006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsLinearGradient006)},
        ani_native_function {"testCommonAttrsLinearGradient007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsLinearGradient007)},
        ani_native_function {"testCommonAttrsLinearGradient008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsLinearGradient008)},
        ani_native_function {"testCommonAttrsLinearGradient009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsLinearGradient009)},
        ani_native_function {"testCommonAttrsLinearGradient010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsLinearGradient010)},    
        ani_native_function {"testCommonAttrsClip001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsClip001)},
        ani_native_function {"testCommonAttrsClip002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsClip002)},
        ani_native_function {"testCommonAttrsClip003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsClip003)},
        ani_native_function {"testCommonAttrsClip004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsClip004)},
        ani_native_function {"testCommonAttrsClip005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsClip005)},
        ani_native_function {"testCommonAttrsClip006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsClip006)},
        ani_native_function {"testCommonAttrsClip007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsClip007)},     
        ani_native_function {"testCommonAttrsForegroundBlurStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle001)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle002)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle003)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle004)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle005)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle006)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle007)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle008)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle009)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle010)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle011)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle012)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle013)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle014)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle015)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle016)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle017", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle017)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle018", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle018)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle019", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle019)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle020", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle020)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle021", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle021)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle022", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle022)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle023", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle023)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle024", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle024)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle025", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle025)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle026", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle026)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle027", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle027)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle028", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle028)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle029", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle029)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle030", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle030)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle031", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle031)},
        ani_native_function {"testCommonAttrsForegroundBlurStyle032", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsForegroundBlurStyle032)},    
        ani_native_function {"testCommonAttrsBlendMode001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode001)},
        ani_native_function {"testCommonAttrsBlendMode002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode002)},
        ani_native_function {"testCommonAttrsBlendMode003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode003)},
        ani_native_function {"testCommonAttrsBlendMode004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode004)},
        ani_native_function {"testCommonAttrsBlendMode005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode005)},
        ani_native_function {"testCommonAttrsBlendMode006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode006)},
        ani_native_function {"testCommonAttrsBlendMode007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode007)},
        ani_native_function {"testCommonAttrsBlendMode008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode008)},
        ani_native_function {"testCommonAttrsBlendMode009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode009)},
        ani_native_function {"testCommonAttrsBlendMode010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode010)},
        ani_native_function {"testCommonAttrsBlendMode011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode011)},
        ani_native_function {"testCommonAttrsBlendMode012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode012)},
        ani_native_function {"testCommonAttrsBlendMode013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode013)},
        ani_native_function {"testCommonAttrsBlendMode014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode014)},
        ani_native_function {"testCommonAttrsBlendMode015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode015)},
        ani_native_function {"testCommonAttrsBlendMode016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode016)},
        ani_native_function {"testCommonAttrsBlendMode017", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode017)},
        ani_native_function {"testCommonAttrsBlendMode018", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode018)},
        ani_native_function {"testCommonAttrsBlendMode019", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode019)},
        ani_native_function {"testCommonAttrsBlendMode020", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode020)},
        ani_native_function {"testCommonAttrsBlendMode021", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode021)},
        ani_native_function {"testCommonAttrsBlendMode022", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode022)},
        ani_native_function {"testCommonAttrsBlendMode023", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode023)},
        ani_native_function {"testCommonAttrsBlendMode024", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode024)},
        ani_native_function {"testCommonAttrsBlendMode025", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode025)},
        ani_native_function {"testCommonAttrsBlendMode026", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode026)},
        ani_native_function {"testCommonAttrsBlendMode027", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode027)},
        ani_native_function {"testCommonAttrsBlendMode028", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode028)},
        ani_native_function {"testCommonAttrsBlendMode029", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode029)},
        ani_native_function {"testCommonAttrsBlendMode030", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode030)},
        ani_native_function {"testCommonAttrsBlendMode031", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode031)},
        ani_native_function {"testCommonAttrsBlendMode032", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode032)},
        ani_native_function {"testCommonAttrsBlendMode033", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode033)},
        ani_native_function {"testCommonAttrsBlendMode034", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode034)},
        ani_native_function {"testCommonAttrsBlendMode035", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode035)},
        ani_native_function {"testCommonAttrsBlendMode036", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode036)},
        ani_native_function {"testCommonAttrsBlendMode037", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode037)},
        ani_native_function {"testCommonAttrsBlendMode038", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode038)},
        ani_native_function {"testCommonAttrsBlendMode039", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode039)},
        ani_native_function {"testCommonAttrsBlendMode040", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode040)},
        ani_native_function {"testCommonAttrsBlendMode041", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode041)},
        ani_native_function {"testCommonAttrsBlendMode042", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode042)},
        ani_native_function {"testCommonAttrsBlendMode043", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode043)},
        ani_native_function {"testCommonAttrsBlendMode044", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode044)},
        ani_native_function {"testCommonAttrsBlendMode045", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode045)},
        ani_native_function {"testCommonAttrsBlendMode046", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode046)},
        ani_native_function {"testCommonAttrsBlendMode047", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode047)},
        ani_native_function {"testCommonAttrsBlendMode048", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode048)},
        ani_native_function {"testCommonAttrsBlendMode049", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode049)},
        ani_native_function {"testCommonAttrsBlendMode050", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode050)},
        ani_native_function {"testCommonAttrsBlendMode051", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode051)},
        ani_native_function {"testCommonAttrsBlendMode052", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode052)},
        ani_native_function {"testCommonAttrsBlendMode053", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode053)},
        ani_native_function {"testCommonAttrsBlendMode054", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode054)},
        ani_native_function {"testCommonAttrsBlendMode055", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode055)},
        ani_native_function {"testCommonAttrsBlendMode056", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode056)},
        ani_native_function {"testCommonAttrsBlendMode057", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode057)},
        ani_native_function {"testCommonAttrsBlendMode058", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode058)},
        ani_native_function {"testCommonAttrsBlendMode059", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode059)},
        ani_native_function {"testCommonAttrsBlendMode060", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode060)},
        ani_native_function {"testCommonAttrsBlendMode061", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBlendMode061)},    
        ani_native_function {"testCommonAttrsMask001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask001)},
        ani_native_function {"testCommonAttrsMask002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask002)},
        ani_native_function {"testCommonAttrsMask003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask003)},
        ani_native_function {"testCommonAttrsMask004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask004)},
        ani_native_function {"testCommonAttrsMask005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask005)},
        ani_native_function {"testCommonAttrsMask006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask006)},
        ani_native_function {"testCommonAttrsMask007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask007)},
        ani_native_function {"testCommonAttrsMask008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask008)},
        ani_native_function {"testCommonAttrsMask009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask009)},
        ani_native_function {"testCommonAttrsMask010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask010)},
        ani_native_function {"testCommonAttrsMask011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask011)},
        ani_native_function {"testCommonAttrsMask012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask012)},
        ani_native_function {"testCommonAttrsMask013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask013)},
        ani_native_function {"testCommonAttrsMask014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask014)},
        ani_native_function {"testCommonAttrsMask015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask015)},
        ani_native_function {"testCommonAttrsMask016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsMask016)},     
        ani_native_function {"testCommonAttrsTransform001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsTransform001)},
        ani_native_function {"testCommonAttrsTransform002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsTransform002)},
        ani_native_function {"testCommonAttrsTransform003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsTransform003)},
        ani_native_function {"testCommonAttrsTransform004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsTransform004)},
        ani_native_function {"testCommonAttrsSweepGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsSweepGradient001)},
        ani_native_function {"testCommonAttrsSweepGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsSweepGradient002)},
        ani_native_function {"testCommonAttrsSweepGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsSweepGradient003)},
        ani_native_function {"testCommonAttrsSweepGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsSweepGradient004)},
        ani_native_function {"testCommonAttrsSweepGradient005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsSweepGradient005)},    
        ani_native_function {"testCommonAttrsRadialGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsRadialGradient001)},
        ani_native_function {"testCommonAttrsRadialGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsRadialGradient002)},
        ani_native_function {"testCommonAttrsRadialGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsRadialGradient003)},
        ani_native_function {"testCommonAttrsRadialGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsRadialGradient004)},    
        ani_native_function {"testCommonAttrsBorderStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderStyle001)},
        ani_native_function {"testCommonAttrsBorderStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderStyle002)},
        ani_native_function {"testCommonAttrsBorderStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderStyle003)},
        ani_native_function {"testCommonAttrsBorderStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderStyle004)},
        ani_native_function {"testCommonAttrsBorderStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderStyle005)},
        ani_native_function {"testCommonAttrsBorderStyle006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderStyle006)},    
        ani_native_function {"testCommonAttrsBorderRadius001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderRadius001)},
        ani_native_function {"testCommonAttrsBorderRadius002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderRadius002)},
        ani_native_function {"testCommonAttrsBorderRadius003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderRadius003)},
        ani_native_function {"testCommonAttrsBorderRadius004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderRadius004)},
        ani_native_function {"testCommonAttrsBorderRadius005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderRadius005)},
        ani_native_function {"testCommonAttrsBorderRadius006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderRadius006)},    
        ani_native_function {"testCommonAttrsBorderColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderColor001)},
        ani_native_function {"testCommonAttrsBorderColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderColor002)},    
        ani_native_function {"testCommonAttrsBorderWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderWidth001)},
        ani_native_function {"testCommonAttrsBorderWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderWidth002)}, 
        ani_native_function {"testCommonAttrsBorderWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderWidth003)},
        ani_native_function {"testCommonAttrsBorderWidth004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBorderWidth004)},
        ani_native_function {"testCommonAttrsPosition001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsPosition001)},
        ani_native_function {"testCommonAttrsPosition002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsPosition002)},    
        ani_native_function {"testCommonAttrsBackgroundColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBackgroundColor001)},
        ani_native_function {"testCommonAttrsBackgroundColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBackgroundColor002)},
        ani_native_function {"testCommonAttrsBackgroundColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsBackgroundColor003)},    
        ani_native_function {"testCommonAttrsHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsHeight001)},
        ani_native_function {"testCommonAttrsHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsHeight002)},
        ani_native_function {"testCommonAttrsHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsHeight003)},    
        ani_native_function {"testCommonAttrsWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsWidth001)},
        ani_native_function {"testCommonAttrsWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsWidth002)},
        ani_native_function {"testCommonAttrsWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsWidth003)},    
        ani_native_function {"testCommonAttrsJustifyContent001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent001)},
        ani_native_function {"testCommonAttrsJustifyContent002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent002)},
        ani_native_function {"testCommonAttrsJustifyContent003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent003)},
        ani_native_function {"testCommonAttrsJustifyContent004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent004)},
        ani_native_function {"testCommonAttrsJustifyContent005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent005)},
        ani_native_function {"testCommonAttrsJustifyContent006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent006)},
        ani_native_function {"testCommonAttrsJustifyContent007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent007)},
        ani_native_function {"testCommonAttrsJustifyContent008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent008)},
        ani_native_function {"testCommonAttrsJustifyContent009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent009)},
        ani_native_function {"testCommonAttrsJustifyContent010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent010)},
        ani_native_function {"testCommonAttrsJustifyContent011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent011)},
        ani_native_function {"testCommonAttrsJustifyContent012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsJustifyContent012)},    
        ani_native_function {"testCommonAttrsFlexShrink001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsFlexShrink001)},
        ani_native_function {"testCommonAttrsFlexShrink002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsFlexShrink002)},    
        ani_native_function {"testCommonAttrsFlexBasis001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsFlexBasis001)},
        ani_native_function {"testCommonAttrsFlexBasis002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsFlexBasis002)},    
        ani_native_function {"testCommonAttrsFlexGrow001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsFlexGrow001)},
        ani_native_function {"testCommonAttrsFlexGrow002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsFlexGrow002)},    
        ani_native_function {"testCommonAttrsAlignContent001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignContent001)},
        ani_native_function {"testCommonAttrsAlignContent002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignContent002)},
        ani_native_function {"testCommonAttrsAlignContent003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignContent003)},
        ani_native_function {"testCommonAttrsAlignContent004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignContent004)},
        ani_native_function {"testCommonAttrsAlignContent005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignContent005)},
        ani_native_function {"testCommonAttrsAlignContent006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignContent006)},
        ani_native_function {"testCommonAttrsAlignContent007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignContent007)},
        ani_native_function {"testCommonAttrsAlignContent008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignContent008)},
        ani_native_function {"testCommonAttrsAlignContent009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignContent009)},    
        ani_native_function {"testCommonAttrsAlignItems001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignItems001)},
        ani_native_function {"testCommonAttrsAlignItems002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignItems002)},
        ani_native_function {"testCommonAttrsAlignItems003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignItems003)},
        ani_native_function {"testCommonAttrsAlignItems004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignItems004)},
        ani_native_function {"testCommonAttrsAlignItems005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignItems005)},
        ani_native_function {"testCommonAttrsAlignItems006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignItems006)},    
        ani_native_function {"testCommonAttrsAlignSelf001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignSelf001)},
        ani_native_function {"testCommonAttrsAlignSelf002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignSelf002)},
        ani_native_function {"testCommonAttrsAlignSelf003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignSelf003)},
        ani_native_function {"testCommonAttrsAlignSelf004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignSelf004)},
        ani_native_function {"testCommonAttrsAlignSelf005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignSelf005)},
        ani_native_function {"testCommonAttrsAlignSelf006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsAlignSelf006)},    
        ani_native_function {"testCustomDialogMaskColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogMaskColor001)},
        ani_native_function {"testCustomDialogMaskColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomDialogMaskColor002)},    
        ani_native_function {"testCustomComponentDirection001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentDirection001)},
        ani_native_function {"testCustomComponentDirection002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentDirection002)},
        ani_native_function {"testCustomComponentDirection003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentDirection003)},
        ani_native_function {"testCustomComponentDirection004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentDirection004)},
        ani_native_function {"testCustomComponentDirection005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentDirection005)},    
        ani_native_function {"testCustomComponentAlign001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlign001)},
        ani_native_function {"testCustomComponentAlign002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlign002)},
        ani_native_function {"testCustomComponentAlign003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlign003)},
        ani_native_function {"testCustomComponentAlign004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlign004)},
        ani_native_function {"testCustomComponentAlign005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlign005)},
        ani_native_function {"testCustomComponentAlign006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlign006)},
        ani_native_function {"testCustomComponentAlign007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlign007)},
        ani_native_function {"testCustomComponentAlign008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlign008)},
        ani_native_function {"testCustomComponentAlign009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlign009)},
        ani_native_function {"testCustomComponentAlign010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlign010)},
        ani_native_function {"testCustomComponentAlign011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlign011)},    
        ani_native_function {"testCustomComponentSepia001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentSepia001)},
        ani_native_function {"testCustomComponentSepia002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentSepia002)},
        ani_native_function {"testCustomComponentSepia003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentSepia003)},
        ani_native_function {"testCustomComponentSepia004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentSepia004)},
        ani_native_function {"testCustomComponentSepia005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentSepia005)},
        ani_native_function {"testCustomComponentSepia006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentSepia006)},    
        ani_native_function {"testCustomComponentOpacity001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentOpacity001)},
        ani_native_function {"testCustomComponentOpacity002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentOpacity002)},
        ani_native_function {"testCustomComponentOpacity003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentOpacity003)},
        ani_native_function {"testCustomComponentOpacity004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentOpacity004)},
        ani_native_function {"testCustomComponentOpacity005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentOpacity005)},
        ani_native_function {"testCustomComponentOpacity006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentOpacity006)},    
        ani_native_function {"testCustomComponentInvert001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentInvert001)},
        ani_native_function {"testCustomComponentInvert002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentInvert002)},
        ani_native_function {"testCustomComponentInvert003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentInvert003)},
        ani_native_function {"testCustomComponentInvert004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentInvert004)},
        ani_native_function {"testCustomComponentInvert005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentInvert005)},
        ani_native_function {"testCustomComponentInvert006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentInvert006)},    
        ani_native_function {"testCustomComponentGrayscale001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentGrayscale001)},
        ani_native_function {"testCustomComponentGrayscale002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentGrayscale002)},
        ani_native_function {"testCustomComponentGrayscale003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentGrayscale003)},
        ani_native_function {"testCustomComponentGrayscale004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentGrayscale004)},
        ani_native_function {"testCustomComponentGrayscale005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentGrayscale005)},
        ani_native_function {"testCustomComponentGrayscale006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentGrayscale006)},    
        ani_native_function {"testCustomComponentContrast001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentContrast001)},
        ani_native_function {"testCustomComponentContrast002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentContrast002)},
        ani_native_function {"testCustomComponentContrast003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentContrast003)},
        ani_native_function {"testCustomComponentContrast004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentContrast004)},
        ani_native_function {"testCustomComponentContrast005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentContrast005)},
        ani_native_function {"testCustomComponentContrast006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentContrast006)},    
        ani_native_function {"testCustomComponentConstraintSize001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentConstraintSize001)},
        ani_native_function {"testCustomComponentConstraintSize002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentConstraintSize002)},
        ani_native_function {"testCustomComponentConstraintSize003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentConstraintSize003)},
        ani_native_function {"testCustomComponentConstraintSize003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentConstraintSize003)},
        ani_native_function {"testCustomComponentConstraintSize004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentConstraintSize004)},
        ani_native_function {"testCustomComponentLinearGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient001)},
        ani_native_function {"testCustomComponentLinearGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient002)},
        ani_native_function {"testCustomComponentLinearGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient003)},
        ani_native_function {"testCustomComponentLinearGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient004)},
        ani_native_function {"testCustomComponentLinearGradient005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient005)},
        ani_native_function {"testCustomComponentLinearGradient006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient006)},
        ani_native_function {"testCustomComponentLinearGradient007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient007)},
        ani_native_function {"testCustomComponentLinearGradient008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient008)},
        ani_native_function {"testCustomComponentLinearGradient009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient009)},
        ani_native_function {"testCustomComponentLinearGradient010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient010)},    
        ani_native_function {"testCustomComponentMargin001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMargin001)},
        ani_native_function {"testCustomComponentMargin002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMargin002)},
        ani_native_function {"testCustomComponentMargin003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMargin003)},
        ani_native_function {"testCustomComponentMargin004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMargin004)},    
        ani_native_function {"testCustomComponentScale001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentScale001)},
        ani_native_function {"testCustomComponentScale002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentScale002)},
        ani_native_function {"testCustomComponentScale003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentScale003)},
        ani_native_function {"testCustomComponentScale004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentScale004)},
        ani_native_function {"testCustomComponentScale005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentScale005)},    
        ani_native_function {"testCustomComponentLinearGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient001)},
        ani_native_function {"testCustomComponentLinearGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient002)},
        ani_native_function {"testCustomComponentLinearGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient003)},
        ani_native_function {"testCustomComponentLinearGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient004)},
        ani_native_function {"testCustomComponentLinearGradient005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient005)},
        ani_native_function {"testCustomComponentLinearGradient006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient006)},
        ani_native_function {"testCustomComponentLinearGradient007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient007)},
        ani_native_function {"testCustomComponentLinearGradient008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient008)},
        ani_native_function {"testCustomComponentLinearGradient009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient009)},
        ani_native_function {"testCustomComponentLinearGradient010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentLinearGradient010)},    
        ani_native_function {"testCustomComponentClip001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentClip001)},
        ani_native_function {"testCustomComponentClip002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentClip002)},
        ani_native_function {"testCustomComponentClip003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentClip003)},
        ani_native_function {"testCustomComponentClip004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentClip004)},
        ani_native_function {"testCustomComponentClip005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentClip005)},
        ani_native_function {"testCustomComponentClip006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentClip006)},
        ani_native_function {"testCustomComponentClip007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentClip007)},     
        ani_native_function {"testCustomComponentBlendMode001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode001)},
        ani_native_function {"testCustomComponentBlendMode002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode002)},
        ani_native_function {"testCustomComponentBlendMode003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode003)},
        ani_native_function {"testCustomComponentBlendMode004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode004)},
        ani_native_function {"testCustomComponentBlendMode005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode005)},
        ani_native_function {"testCustomComponentBlendMode006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode006)},
        ani_native_function {"testCustomComponentBlendMode007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode007)},
        ani_native_function {"testCustomComponentBlendMode008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode008)},
        ani_native_function {"testCustomComponentBlendMode009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode009)},
        ani_native_function {"testCustomComponentBlendMode010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode010)},
        ani_native_function {"testCustomComponentBlendMode011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode011)},
        ani_native_function {"testCustomComponentBlendMode012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode012)},
        ani_native_function {"testCustomComponentBlendMode013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode013)},
        ani_native_function {"testCustomComponentBlendMode014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode014)},
        ani_native_function {"testCustomComponentBlendMode015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode015)},
        ani_native_function {"testCustomComponentBlendMode016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode016)},
        ani_native_function {"testCustomComponentBlendMode017", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode017)},
        ani_native_function {"testCustomComponentBlendMode018", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode018)},
        ani_native_function {"testCustomComponentBlendMode019", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode019)},
        ani_native_function {"testCustomComponentBlendMode020", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode020)},
        ani_native_function {"testCustomComponentBlendMode021", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode021)},
        ani_native_function {"testCustomComponentBlendMode022", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode022)},
        ani_native_function {"testCustomComponentBlendMode023", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode023)},
        ani_native_function {"testCustomComponentBlendMode024", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode024)},
        ani_native_function {"testCustomComponentBlendMode025", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode025)},
        ani_native_function {"testCustomComponentBlendMode026", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode026)},
        ani_native_function {"testCustomComponentBlendMode027", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode027)},
        ani_native_function {"testCustomComponentBlendMode028", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode028)},
        ani_native_function {"testCustomComponentBlendMode029", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode029)},
        ani_native_function {"testCustomComponentBlendMode030", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode030)},
        ani_native_function {"testCustomComponentBlendMode031", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode031)},
        ani_native_function {"testCustomComponentBlendMode032", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode032)},
        ani_native_function {"testCustomComponentBlendMode033", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode033)},
        ani_native_function {"testCustomComponentBlendMode034", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode034)},
        ani_native_function {"testCustomComponentBlendMode035", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode035)},
        ani_native_function {"testCustomComponentBlendMode036", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode036)},
        ani_native_function {"testCustomComponentBlendMode037", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode037)},
        ani_native_function {"testCustomComponentBlendMode038", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode038)},
        ani_native_function {"testCustomComponentBlendMode039", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode039)},
        ani_native_function {"testCustomComponentBlendMode040", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode040)},
        ani_native_function {"testCustomComponentBlendMode041", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode041)},
        ani_native_function {"testCustomComponentBlendMode042", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode042)},
        ani_native_function {"testCustomComponentBlendMode043", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode043)},
        ani_native_function {"testCustomComponentBlendMode044", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode044)},
        ani_native_function {"testCustomComponentBlendMode045", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode045)},
        ani_native_function {"testCustomComponentBlendMode046", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode046)},
        ani_native_function {"testCustomComponentBlendMode047", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode047)},
        ani_native_function {"testCustomComponentBlendMode048", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode048)},
        ani_native_function {"testCustomComponentBlendMode049", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode049)},
        ani_native_function {"testCustomComponentBlendMode050", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode050)},
        ani_native_function {"testCustomComponentBlendMode051", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode051)},
        ani_native_function {"testCustomComponentBlendMode052", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode052)},
        ani_native_function {"testCustomComponentBlendMode053", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode053)},
        ani_native_function {"testCustomComponentBlendMode054", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode054)},
        ani_native_function {"testCustomComponentBlendMode055", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode055)},
        ani_native_function {"testCustomComponentBlendMode056", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode056)},
        ani_native_function {"testCustomComponentBlendMode057", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode057)},
        ani_native_function {"testCustomComponentBlendMode058", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode058)},
        ani_native_function {"testCustomComponentBlendMode059", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode059)},
        ani_native_function {"testCustomComponentBlendMode060", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode060)},
        ani_native_function {"testCustomComponentBlendMode061", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBlendMode061)},    
        ani_native_function {"testCustomComponentMask001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask001)},
        ani_native_function {"testCustomComponentMask002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask002)},
        ani_native_function {"testCustomComponentMask003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask003)},
        ani_native_function {"testCustomComponentMask004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask004)},
        ani_native_function {"testCustomComponentMask005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask005)},
        ani_native_function {"testCustomComponentMask006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask006)},
        ani_native_function {"testCustomComponentMask007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask007)},
        ani_native_function {"testCustomComponentMask008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask008)},
        ani_native_function {"testCustomComponentMask009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask009)},
        ani_native_function {"testCustomComponentMask010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask010)},
        ani_native_function {"testCustomComponentMask011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask011)},
        ani_native_function {"testCustomComponentMask012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask012)},
        ani_native_function {"testCustomComponentMask013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask013)},
        ani_native_function {"testCustomComponentMask014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask014)},
        ani_native_function {"testCustomComponentMask015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask015)},
        ani_native_function {"testCustomComponentMask016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentMask016)},      
        ani_native_function {"testCustomComponentTransform001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentTransform001)},
        ani_native_function {"testCustomComponentTransform002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentTransform002)},
        ani_native_function {"testCustomComponentTransform003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentTransform003)},
        ani_native_function {"testCustomComponentTransform004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentTransform004)},    
        ani_native_function {"testCustomComponentRadialGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentRadialGradient001)},
        ani_native_function {"testCustomComponentRadialGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentRadialGradient002)},
        ani_native_function {"testCustomComponentRadialGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentRadialGradient003)},
        ani_native_function {"testCustomComponentRadialGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentRadialGradient004)},    
        ani_native_function {"testCustomComponentSweepGradient001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentSweepGradient001)},
        ani_native_function {"testCustomComponentSweepGradient002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentSweepGradient002)},
        ani_native_function {"testCustomComponentSweepGradient003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentSweepGradient003)},
        ani_native_function {"testCustomComponentSweepGradient004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentSweepGradient004)},
        ani_native_function {"testCustomComponentSweepGradient005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentSweepGradient005)},    
        ani_native_function {"testCustomComponentPosition001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentPosition001)},
        ani_native_function {"testCustomComponentPosition002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentPosition002)},    
        ani_native_function {"testCustomComponentHeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentHeight001)},
        ani_native_function {"testCustomComponentHeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentHeight002)},
        ani_native_function {"testCustomComponentHeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentHeight003)},    
        ani_native_function {"testCustomComponentWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentWidth001)},
        ani_native_function {"testCustomComponentWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentWidth002)},
        ani_native_function {"testCustomComponentWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentWidth003)},    
        ani_native_function {"testCustomComponentForegroundBlurStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle001)},
        ani_native_function {"testCustomComponentForegroundBlurStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle002)},
        ani_native_function {"testCustomComponentForegroundBlurStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle003)},
        ani_native_function {"testCustomComponentForegroundBlurStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle004)},
        ani_native_function {"testCustomComponentForegroundBlurStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle005)},
        ani_native_function {"testCustomComponentForegroundBlurStyle006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle006)},
        ani_native_function {"testCustomComponentForegroundBlurStyle007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle007)},
        ani_native_function {"testCustomComponentForegroundBlurStyle008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle008)},
        ani_native_function {"testCustomComponentForegroundBlurStyle009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle009)},
        ani_native_function {"testCustomComponentForegroundBlurStyle010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle010)},
        ani_native_function {"testCustomComponentForegroundBlurStyle011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle011)},
        ani_native_function {"testCustomComponentForegroundBlurStyle012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle012)},
        ani_native_function {"testCustomComponentForegroundBlurStyle013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle013)},
        ani_native_function {"testCustomComponentForegroundBlurStyle014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle014)},
        ani_native_function {"testCustomComponentForegroundBlurStyle015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle015)},
        ani_native_function {"testCustomComponentForegroundBlurStyle016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle016)},
        ani_native_function {"testCustomComponentForegroundBlurStyle017", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle017)},
        ani_native_function {"testCustomComponentForegroundBlurStyle018", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle018)},
        ani_native_function {"testCustomComponentForegroundBlurStyle019", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle019)},
        ani_native_function {"testCustomComponentForegroundBlurStyle020", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle020)},
        ani_native_function {"testCustomComponentForegroundBlurStyle021", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle021)},
        ani_native_function {"testCustomComponentForegroundBlurStyle022", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle022)},
        ani_native_function {"testCustomComponentForegroundBlurStyle023", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle023)},
        ani_native_function {"testCustomComponentForegroundBlurStyle024", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle024)},
        ani_native_function {"testCustomComponentForegroundBlurStyle025", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle025)},
        ani_native_function {"testCustomComponentForegroundBlurStyle026", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle026)},
        ani_native_function {"testCustomComponentForegroundBlurStyle027", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle027)},
        ani_native_function {"testCustomComponentForegroundBlurStyle028", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle028)},
        ani_native_function {"testCustomComponentForegroundBlurStyle029", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle029)},
        ani_native_function {"testCustomComponentForegroundBlurStyle030", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle030)},
        ani_native_function {"testCustomComponentForegroundBlurStyle031", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle031)},
        ani_native_function {"testCustomComponentForegroundBlurStyle032", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentForegroundBlurStyle032)},    
        ani_native_function {"testCustomComponentBorderWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderWidth001)},
        ani_native_function {"testCustomComponentBorderWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderWidth002)},
        ani_native_function {"testCustomComponentBorderWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderWidth003)},
        ani_native_function {"testCustomComponentBorderWidth004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderWidth004)},    
        ani_native_function {"testCustomComponentBorderStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderStyle001)},
        ani_native_function {"testCustomComponentBorderStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderStyle002)},
        ani_native_function {"testCustomComponentBorderStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderStyle003)},
        ani_native_function {"testCustomComponentBorderStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderStyle004)},
        ani_native_function {"testCustomComponentBorderStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderStyle005)},
        ani_native_function {"testCustomComponentBorderStyle006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderStyle006)},    
        ani_native_function {"testCustomComponentBorderRadius001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderRadius001)},
        ani_native_function {"testCustomComponentBorderRadius002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderRadius002)},
        ani_native_function {"testCustomComponentBorderRadius003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderRadius003)},
        ani_native_function {"testCustomComponentBorderRadius004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderRadius004)},
        ani_native_function {"testCustomComponentBorderRadius005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderRadius005)},
        ani_native_function {"testCustomComponentBorderRadius006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderRadius006)},    
        ani_native_function {"testCustomComponentBorderColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderColor001)},
        ani_native_function {"testCustomComponentBorderColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBorderColor002)},    
        ani_native_function {"testCustomComponentBackgroundColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBackgroundColor001)},
        ani_native_function {"testCustomComponentBackgroundColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBackgroundColor002)},
        ani_native_function {"testCustomComponentBackgroundColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentBackgroundColor003)},    
        ani_native_function {"testCustomComponentFlexShrink001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentFlexShrink001)},
        ani_native_function {"testCustomComponentFlexShrink002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentFlexShrink002)},    
        ani_native_function {"testCustomComponentFlexBasis001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentFlexBasis001)},
        ani_native_function {"testCustomComponentFlexBasis002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentFlexBasis002)},    
        ani_native_function {"testCustomComponentFlexGrow001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentFlexGrow001)},
        ani_native_function {"testCustomComponentFlexGrow002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentFlexGrow002)},    
        ani_native_function {"testCustomComponentAlignSelf001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlignSelf001)},
        ani_native_function {"testCustomComponentAlignSelf002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlignSelf002)},
        ani_native_function {"testCustomComponentAlignSelf003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlignSelf003)},
        ani_native_function {"testCustomComponentAlignSelf004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlignSelf004)},
        ani_native_function {"testCustomComponentAlignSelf005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlignSelf005)},
        ani_native_function {"testCustomComponentAlignSelf006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAlignSelf006)},    
        ani_native_function {"testCustomComponentAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityGroup001)},
        ani_native_function {"testCustomComponentAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityGroup002)},
        ani_native_function {"testCustomComponentAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityGroup003)},
        ani_native_function {"testCustomComponentAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityGroup004)},    
        ani_native_function {"testCustomComponentAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityDescription001)},
        ani_native_function {"testCustomComponentAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityDescription002)},     
        ani_native_function {"testCustomComponentAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityLevel001)},
        ani_native_function {"testCustomComponentAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityLevel002)},
        ani_native_function {"testCustomComponentAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityLevel003)},
        ani_native_function {"testCustomComponentAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityLevel004)},
        ani_native_function {"testCustomComponentAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityText001)},
        ani_native_function {"testCustomComponentAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentAccessibilityText002)},     
        ani_native_function {"testProgressAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityDescription001)},
        ani_native_function {"testProgressAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityDescription002)},
        ani_native_function {"testProgressAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityGroup001)},
        ani_native_function {"testProgressAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityGroup002)},
        ani_native_function {"testProgressAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityGroup003)},
        ani_native_function {"testProgressAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityGroup004)},
        ani_native_function {"testProgressAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityLevel001)},
        ani_native_function {"testProgressAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityLevel002)},
        ani_native_function {"testProgressAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityLevel003)},
        ani_native_function {"testProgressAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityLevel004)},
        ani_native_function {"testProgressAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityLevel005)},
        ani_native_function {"testProgressAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityLevel006)},    
        ani_native_function {"testProgressAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityText001)},
        ani_native_function {"testProgressAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressAccessibilityText002)},    
        ani_native_function {"testCheckboxAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityDescription001)},
        ani_native_function {"testCheckboxAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityDescription002)},
        ani_native_function {"testCheckboxAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityGroup001)},
        ani_native_function {"testCheckboxAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityGroup002)},
        ani_native_function {"testCheckboxAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityGroup003)},
        ani_native_function {"testCheckboxAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityGroup004)},
        ani_native_function {"testCheckboxAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityLevel001)},
        ani_native_function {"testCheckboxAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityLevel002)},
        ani_native_function {"testCheckboxAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityLevel003)},
        ani_native_function {"testCheckboxAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityLevel004)},
        ani_native_function {"testCheckboxAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityLevel005)},
        ani_native_function {"testCheckboxAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityLevel006)},
        ani_native_function {"testCheckboxAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityText001)},
        ani_native_function {"testCheckboxAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxAccessibilityText002)},    
        ani_native_function {"testTextPickerAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityDescription001)},
        ani_native_function {"testTextPickerAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityDescription002)},
        ani_native_function {"testTextPickerAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityGroup001)},
        ani_native_function {"testTextPickerAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityGroup002)},
        ani_native_function {"testTextPickerAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityGroup003)},
        ani_native_function {"testTextPickerAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityGroup004)},
        ani_native_function {"testTextPickerAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel001)},
        ani_native_function {"testTextPickerAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel002)},
        ani_native_function {"testTextPickerAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel003)},
        ani_native_function {"testTextPickerAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel004)},
        ani_native_function {"testTextPickerAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel005)},
        ani_native_function {"testTextPickerAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel006)},
        ani_native_function {"testTextPickerAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityText001)},
        ani_native_function {"testTextPickerAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityText002)},    
        ani_native_function {"testButtonAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityDescription001)},
        ani_native_function {"testButtonAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityDescription002)},
        ani_native_function {"testButtonAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityGroup001)},
        ani_native_function {"testButtonAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityGroup002)},
        ani_native_function {"testButtonAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityGroup003)},
        ani_native_function {"testButtonAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityGroup004)},
        ani_native_function {"testButtonAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityLevel001)},
        ani_native_function {"testButtonAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityLevel002)},
        ani_native_function {"testButtonAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityLevel003)},
        ani_native_function {"testButtonAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityLevel004)},
        ani_native_function {"testButtonAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityLevel005)},
        ani_native_function {"testButtonAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityLevel006)},
        ani_native_function {"testButtonAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityText001)},
        ani_native_function {"testButtonAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonAccessibilityText002)},
        ani_native_function {"testSliderAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityLevel005)},
        ani_native_function {"testSliderAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityLevel006)},    
        ani_native_function {"testSliderAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityDescription001)},
        ani_native_function {"testSliderAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityDescription002)},
        ani_native_function {"testSliderAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityGroup001)},
        ani_native_function {"testSliderAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityGroup002)},
        ani_native_function {"testSliderAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityGroup003)},
        ani_native_function {"testSliderAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityGroup004)},
        ani_native_function {"testSliderAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityLevel001)},
        ani_native_function {"testSliderAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityLevel002)},
        ani_native_function {"testSliderAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityLevel003)},
        ani_native_function {"testSliderAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityLevel004)},
        ani_native_function {"testSliderAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityText001)},
        ani_native_function {"testSliderAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderAccessibilityText002)},    
        ani_native_function {"testTimePickerAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityDescription001)},
        ani_native_function {"testTimePickerAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityDescription002)},
        ani_native_function {"testTimePickerAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityGroup001)},
        ani_native_function {"testTimePickerAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityGroup002)},
        ani_native_function {"testTimePickerAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityGroup003)},
        ani_native_function {"testTimePickerAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityGroup004)},
        ani_native_function {"testTimePickerAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel001)},
        ani_native_function {"testTimePickerAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel002)},
        ani_native_function {"testTimePickerAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel003)},
        ani_native_function {"testTimePickerAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel004)},
        ani_native_function {"testTimePickerAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel005)},
        ani_native_function {"testTimePickerAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel006)},
        ani_native_function {"testTimePickerAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityText001)},
        ani_native_function {"testTimePickerAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityText002)},    
        ani_native_function {"testDatePickerAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityDescription001)},
        ani_native_function {"testDatePickerAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityDescription002)},
        ani_native_function {"testDatePickerAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityGroup001)},
        ani_native_function {"testDatePickerAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityGroup002)},
        ani_native_function {"testDatePickerAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityGroup003)},
        ani_native_function {"testDatePickerAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityGroup004)},
        ani_native_function {"testDatePickerAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel001)},
        ani_native_function {"testDatePickerAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel002)},
        ani_native_function {"testDatePickerAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel003)},
        ani_native_function {"testDatePickerAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel004)},
        ani_native_function {"testDatePickerAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel005)},
        ani_native_function {"testDatePickerAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel006)},
        ani_native_function {"testDatePickerAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityText001)},
        ani_native_function {"testDatePickerAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityText002)},    
        ani_native_function {"testRefreshAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityLevel005)},
        ani_native_function {"testRefreshAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityLevel006)},    
        ani_native_function {"testRefreshAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityDescription001)},
        ani_native_function {"testRefreshAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityDescription002)},
        ani_native_function {"testRefreshAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityGroup001)},
        ani_native_function {"testRefreshAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityGroup002)},
        ani_native_function {"testRefreshAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityGroup003)},
        ani_native_function {"testRefreshAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityGroup004)},
        ani_native_function {"testRefreshAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityLevel001)},
        ani_native_function {"testRefreshAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityLevel002)},
        ani_native_function {"testRefreshAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityLevel003)},
        ani_native_function {"testRefreshAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityLevel004)},
        ani_native_function {"testRefreshAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityText001)},
        ani_native_function {"testRefreshAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshAccessibilityText002)},    
        ani_native_function {"testTextAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityLevel005)},
        ani_native_function {"testTextAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityLevel006)},    
        ani_native_function {"testTextAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityDescription001)},
        ani_native_function {"testTextAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityDescription002)},
        ani_native_function {"testTextAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityGroup001)},
        ani_native_function {"testTextAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityGroup002)},
        ani_native_function {"testTextAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityGroup003)},
        ani_native_function {"testTextAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityGroup004)},
        ani_native_function {"testTextAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityLevel001)},
        ani_native_function {"testTextAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityLevel002)},
        ani_native_function {"testTextAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityLevel003)},
        ani_native_function {"testTextAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityLevel004)},
        ani_native_function {"testTextAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityText001)},
        ani_native_function {"testTextAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextAccessibilityText002)},    
        ani_native_function {"testToggleAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityLevel005)},
        ani_native_function {"testToggleAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityLevel006)},    
        ani_native_function {"testToggleAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityDescription001)},
        ani_native_function {"testToggleAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityDescription002)},
        ani_native_function {"testToggleAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityGroup001)},
        ani_native_function {"testToggleAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityGroup002)},
        ani_native_function {"testToggleAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityGroup003)},
        ani_native_function {"testToggleAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityGroup004)},
        ani_native_function {"testToggleAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityLevel001)},
        ani_native_function {"testToggleAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityLevel002)},
        ani_native_function {"testToggleAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityLevel003)},
        ani_native_function {"testToggleAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityLevel004)},
        ani_native_function {"testToggleAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityText001)},
        ani_native_function {"testToggleAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestToggleAccessibilityText002)},    
        ani_native_function {"testListAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityText001)},
        ani_native_function {"testListAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityText002)},
        ani_native_function {"testListAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityLevel005)},
        ani_native_function {"testListAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityLevel006)},
        ani_native_function {"testListAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityLevel001)},
        ani_native_function {"testListAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityLevel002)},
        ani_native_function {"testListAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityLevel003)},
        ani_native_function {"testListAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityLevel004)},
        ani_native_function {"testListAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityGroup001)},
        ani_native_function {"testListAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityGroup002)},
        ani_native_function {"testListAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityGroup003)},
        ani_native_function {"testListAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityGroup004)},
        ani_native_function {"testListAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityDescription001)},
        ani_native_function {"testListAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListAccessibilityDescription002)},    
        ani_native_function {"testScrollAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityDescription001)},
        ani_native_function {"testScrollAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityDescription002)},
        ani_native_function {"testScrollAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityGroup001)},
        ani_native_function {"testScrollAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityGroup002)},
        ani_native_function {"testScrollAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityGroup003)},
        ani_native_function {"testScrollAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityGroup004)},
        ani_native_function {"testScrollAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityLevel001)},
        ani_native_function {"testScrollAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityLevel002)},
        ani_native_function {"testScrollAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityLevel003)},
        ani_native_function {"testScrollAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityLevel004)},
        ani_native_function {"testScrollAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityLevel005)},
        ani_native_function {"testScrollAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityLevel006)},
        ani_native_function {"testScrollAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityText001)},
        ani_native_function {"testScrollAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollAccessibilityText002)},    
        ani_native_function {"testSwiperAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityDescription001)},
        ani_native_function {"testSwiperAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityDescription002)},
        ani_native_function {"testSwiperAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityGroup001)},
        ani_native_function {"testSwiperAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityGroup002)},
        ani_native_function {"testSwiperAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityGroup003)},
        ani_native_function {"testSwiperAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityGroup004)},
        ani_native_function {"testSwiperAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityLevel001)},
        ani_native_function {"testSwiperAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityLevel002)},
        ani_native_function {"testSwiperAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityLevel003)},
        ani_native_function {"testSwiperAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityLevel004)},
        ani_native_function {"testSwiperAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityLevel005)},
        ani_native_function {"testSwiperAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityLevel006)},
        ani_native_function {"testSwiperAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityText001)},
        ani_native_function {"testSwiperAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSwiperAccessibilityText002)},    
        ani_native_function {"testRefreshOffset001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshOffset001)},
        ani_native_function {"testRefreshOffset002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshOffset002)},
        ani_native_function {"testRefreshOffset003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshOffset003)},
        ani_native_function {"testRefreshOffset004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshOffset004)},
        ani_native_function {"testRefreshPullDownRatio001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullDownRatio001)},
        ani_native_function {"testRefreshPullDownRatio002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullDownRatio002)},
        ani_native_function {"testRefreshPullDownRatio003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullDownRatio003)},
        ani_native_function {"testRefreshPullDownRatio004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullDownRatio004)},
        ani_native_function {"testRefreshPullDownRatio005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullDownRatio005)},
        ani_native_function {"testRefreshPullDownRatio006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullDownRatio006)},
        ani_native_function {"testRefreshPullDownRatio007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullDownRatio007)},
        ani_native_function {"testRefreshPullToRefresh001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullToRefresh001)},
        ani_native_function {"testRefreshPullToRefresh002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullToRefresh002)},
        ani_native_function {"testRefreshPullToRefresh003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullToRefresh003)},
        ani_native_function {"testRefreshPullToRefresh004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullToRefresh004)},
        ani_native_function {"testRefreshPullToRefresh005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullToRefresh005)},
        ani_native_function {"testRefreshPullToRefresh006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshPullToRefresh006)},
        ani_native_function {"testRefreshRefreshing001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshRefreshing001)},
        ani_native_function {"testRefreshRefreshing002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshRefreshing002)},
        ani_native_function {"testRefreshRefreshing003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshRefreshing003)},
        ani_native_function {"testRefreshRefreshing004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshRefreshing004)},
        ani_native_function {"testRefreshContent001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshContent001)},
        ani_native_function {"testRefreshContent002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestRefreshContent002)},        
        ani_native_function {"testProgressStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressStyle001)},
        ani_native_function {"testProgressStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressStyle002)},
        ani_native_function {"testProgressStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressStyle003)},
        ani_native_function {"testProgressStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressStyle004)},
        ani_native_function {"testProgressStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressStyle005)},
        ani_native_function {"testProgressStyle006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressStyle006)},
        ani_native_function {"testProgressTotal001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressTotal001)},
        ani_native_function {"testProgressTotal002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressTotal002)},
        ani_native_function {"testProgressTotal003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressTotal003)},
        ani_native_function {"testProgressTotal004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressTotal004)},
        ani_native_function {"testProgressTotal005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressTotal005)},
        ani_native_function {"testProgressTotal006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressTotal006)},
        ani_native_function {"testProgressValue001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressValue001)},
        ani_native_function {"testProgressValue002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressValue002)},
        ani_native_function {"testProgressValue003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressValue003)},
        ani_native_function {"testProgressValue004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressValue004)},
        ani_native_function {"testProgressValue005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressValue005)},
        ani_native_function {"testProgressValue006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressValue006)},
        ani_native_function {"testProgressValue007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressValue007)},    
        ani_native_function {"testProgressType001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressType001)},
        ani_native_function {"testProgressType002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressType002)},
        ani_native_function {"testProgressType003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressType003)},
        ani_native_function {"testProgressType004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressType004)},
        ani_native_function {"testProgressType005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressType005)},
        ani_native_function {"testProgressType006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressType006)},
        ani_native_function {"testProgressType007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressType007)},
        ani_native_function {"testProgressType008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressType008)},
        ani_native_function {"testProgressType009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressType009)},       
        ani_native_function {"testProgressBackgroundColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressBackgroundColor002)},
        ani_native_function {"testProgressBackgroundColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressBackgroundColor003)},    
        ani_native_function {"testProgressColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressColor001)},
        ani_native_function {"testProgressColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressColor002)},
        ani_native_function {"testProgressColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressColor003)},    
        ani_native_function {"testProgressBackgroundColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestProgressBackgroundColor001)},    
        ani_native_function {"testLoadingProgressEnableLoading003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLoadingProgressEnableLoading003)},
        ani_native_function {"testLoadingProgressEnableLoading001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLoadingProgressEnableLoading001)},
        ani_native_function {"testLoadingProgressEnableLoading002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLoadingProgressEnableLoading002)},
        ani_native_function {"testLoadingProgressColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLoadingProgressColor001)},
        ani_native_function {"testLoadingProgressColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLoadingProgressColor002)},
        ani_native_function {"testLoadingProgressColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLoadingProgressColor003)},      
        ani_native_function {"testSliderValue001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderValue001)},
        ani_native_function {"testSliderValue002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderValue002)},
        ani_native_function {"testSliderValue003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderValue003)},
        ani_native_function {"testSliderValue004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderValue004)},
        ani_native_function {"testSliderValue005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderValue005)},     
        ani_native_function {"testSliderTrackThickness001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness001)},
        ani_native_function {"testSliderTrackThickness002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness002)},
        ani_native_function {"testSliderTrackThickness003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness003)},
        ani_native_function {"testSliderTrackThickness004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness004)},
        ani_native_function {"testSliderTrackThickness005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness005)},
        ani_native_function {"testSliderTrackThickness006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness006)},
        ani_native_function {"testSliderTrackThickness007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness007)},
        ani_native_function {"testSliderTrackThickness008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness008)},
        ani_native_function {"testSliderTrackThickness009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness009)},
        ani_native_function {"testSliderTrackThickness010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness010)},
        ani_native_function {"testSliderTrackThickness011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness011)},
        ani_native_function {"testSliderTrackThickness012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness012)},
        ani_native_function {"testSliderTrackThickness013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness013)},
        ani_native_function {"testSliderTrackThickness014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness014)},
        ani_native_function {"testSliderTrackThickness015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackThickness015)},    
        ani_native_function {"testSliderTrackColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackColor001)},
        ani_native_function {"testSliderTrackColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackColor002)},
        ani_native_function {"testSliderTrackColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackColor003)},
        ani_native_function {"testSliderTrackColor004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackColor004)},
        ani_native_function {"testSliderTrackColor005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackColor005)},
        ani_native_function {"testSliderTrackColor006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderTrackColor006)},    
        ani_native_function {"testSliderStep001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderStep001)},
        ani_native_function {"testSliderStep002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderStep002)},
        ani_native_function {"testSliderStep003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderStep003)},
        ani_native_function {"testSliderStep004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderStep004)},
        ani_native_function {"testSliderStep005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderStep005)},
        ani_native_function {"testSliderStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderStyle001)},
        ani_native_function {"testSliderStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderStyle002)},
        ani_native_function {"testSliderStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderStyle003)},
        ani_native_function {"testSliderStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderStyle004)},
        ani_native_function {"testSliderStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderStyle005)},    
        ani_native_function {"testSliderShowSteps001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderShowSteps001)},
        ani_native_function {"testSliderShowSteps002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderShowSteps002)},
        ani_native_function {"testSliderShowSteps003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderShowSteps003)},
        ani_native_function {"testSliderShowSteps004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderShowSteps004)},
        ani_native_function {"testSliderShowSteps005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderShowSteps005)},    
        ani_native_function {"testSliderSelectedColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderSelectedColor002)},
        ani_native_function {"testSliderSelectedColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderSelectedColor003)},
        ani_native_function {"testSliderSelectedColor004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderSelectedColor004)},
        ani_native_function {"testSliderSelectedColor005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderSelectedColor005)},
        ani_native_function {"testSliderSelectedColor006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderSelectedColor006)},
        ani_native_function {"testSliderSelectedColor007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderSelectedColor007)},
        ani_native_function {"testSliderReverse001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderReverse001)},
        ani_native_function {"testSliderReverse002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderReverse002)},
        ani_native_function {"testSliderReverse003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderReverse003)},
        ani_native_function {"testSliderReverse004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderReverse004)},
        ani_native_function {"testSliderReverse005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderReverse005)},    
        ani_native_function {"testSliderMax001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderMax001)},
        ani_native_function {"testSliderMax002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderMax002)},
        ani_native_function {"testSliderMax003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderMax003)},
        ani_native_function {"testSliderMax004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderMax004)},
        ani_native_function {"testSliderMax005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderMax005)},
        ani_native_function {"testSliderMin001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderMin001)},
        ani_native_function {"testSliderMin002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderMin002)},
        ani_native_function {"testSliderMin003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderMin003)},
        ani_native_function {"testSliderMin004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderMin004)},
        ani_native_function {"testSliderMin005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderMin005)},    
        ani_native_function {"testSliderDirection001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderDirection001)},
        ani_native_function {"testSliderDirection002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderDirection002)},
        ani_native_function {"testSliderDirection003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderDirection003)},
        ani_native_function {"testSliderDirection004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderDirection004)},
        ani_native_function {"testSliderDirection005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderDirection005)},       
        ani_native_function {"testSliderBlockStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle001)},
        ani_native_function {"testSliderBlockStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle002)},
        ani_native_function {"testSliderBlockStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle003)},
        ani_native_function {"testSliderBlockStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle004)},
        ani_native_function {"testSliderBlockStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle005)},
        ani_native_function {"testSliderBlockStyle006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle006)},
        ani_native_function {"testSliderBlockStyle007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle007)},
        ani_native_function {"testSliderBlockStyle008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle008)},
        ani_native_function {"testSliderBlockStyle009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle009)},
        ani_native_function {"testSliderBlockStyle010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle010)},
        ani_native_function {"testSliderBlockStyle011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle011)},
        ani_native_function {"testSliderBlockStyle012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockStyle012)},
        ani_native_function {"testSliderBlockColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockColor001)},
        ani_native_function {"testSliderBlockColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockColor002)},
        ani_native_function {"testSliderBlockColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockColor003)},
        ani_native_function {"testSliderBlockColor004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockColor004)},
        ani_native_function {"testSliderBlockColor005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockColor005)},
        ani_native_function {"testSliderBlockColor006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockColor006)},
        ani_native_function {"testSliderBlockColor007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestSliderBlockColor007)},    
        ani_native_function {"testCheckboxShape001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxShape001)},
        ani_native_function {"testCheckboxShape002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxShape002)},
        ani_native_function {"testCheckboxShape003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxShape003)},    
        ani_native_function {"testCheckboxMark001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxMark001)},
        ani_native_function {"testCheckboxMark002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxMark002)},
        ani_native_function {"testCheckboxMark003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxMark003)},
        ani_native_function {"testCheckboxMark004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxMark004)},
        ani_native_function {"testCheckboxMark005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxMark005)},
        ani_native_function {"testCheckboxMark006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxMark006)},    
        ani_native_function {"testCheckboxUnselectedColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxUnselectedColor001)},
        ani_native_function {"testCheckboxUnselectedColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxUnselectedColor002)},
        ani_native_function {"testCheckboxUnselectedColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxUnselectedColor003)},
        ani_native_function {"testCheckboxSelectedColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxSelectedColor001)},
        ani_native_function {"testCheckboxSelectedColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxSelectedColor002)},
        ani_native_function {"testCheckboxSelectedColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxSelectedColor003)},    
        ani_native_function {"testCheckboxSelect001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxSelect001)},
        ani_native_function {"testCheckboxSelect002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxSelect002)},
        ani_native_function {"testCheckboxSelect003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCheckboxSelect003)},    
        ani_native_function {"testButtonType001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonType001)},
        ani_native_function {"testButtonType002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonType002)},
        ani_native_function {"testButtonType003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonType003)},
        ani_native_function {"testButtonType004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonType004)},
        ani_native_function {"testButtonType005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonType005)},    
        ani_native_function {"testButtonFontColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontColor001)},
        ani_native_function {"testButtonFontColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontColor002)},
        ani_native_function {"testButtonFontColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontColor003)},    
        ani_native_function {"buttonOnClickTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ButtonOnClickTest::CreateNativeNode)},
        ani_native_function {"buttonLabel001Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ButtonLabelTest::CreateNativeNodeButtonLabel001)},
        ani_native_function {"buttonLabel002Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ButtonLabelTest::CreateNativeNodeButtonLabel002)},
        ani_native_function {"buttonLabel003Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ButtonLabelTest::CreateNativeNodeButtonLabel003)},
        ani_native_function {"buttonLabel004Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ButtonLabelTest::CreateNativeNodeButtonLabel004)},    
        ani_native_function {"testButtonFontWeight001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight001)},
        ani_native_function {"testButtonFontWeight002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight002)},
        ani_native_function {"testButtonFontWeight003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight003)},
        ani_native_function {"testButtonFontWeight004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight004)},
        ani_native_function {"testButtonFontWeight005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight005)},
        ani_native_function {"testButtonFontWeight006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight006)},
        ani_native_function {"testButtonFontWeight007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight007)},
        ani_native_function {"testButtonFontWeight008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight008)},
        ani_native_function {"testButtonFontWeight009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight009)},
        ani_native_function {"testButtonFontWeight010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight010)},
        ani_native_function {"testButtonFontWeight011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight011)},
        ani_native_function {"testButtonFontWeight012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight012)},
        ani_native_function {"testButtonFontWeight013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight013)},
        ani_native_function {"testButtonFontWeight014", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight014)},
        ani_native_function {"testButtonFontWeight015", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight015)},
        ani_native_function {"testButtonFontWeight016", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontWeight016)},    
        ani_native_function {"testButtonBackgroundColor001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonBackgroundColor001)},
        ani_native_function {"testButtonBackgroundColor002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonBackgroundColor002)},
        ani_native_function {"testButtonBackgroundColor003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonBackgroundColor003)},    
        ani_native_function {"testButtonFontSize001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontSize001)},
        ani_native_function {"testButtonFontSize002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontSize002)},
        ani_native_function {"testButtonFontSize003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontSize003)},
        ani_native_function {"testButtonFontSize004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonFontSize004)},    
        ani_native_function {"testDatePickerWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerWidth001)},
        ani_native_function {"testDatePickerWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerWidth002)},
        ani_native_function {"testDatePickerWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerWidth003)},    
        ani_native_function {"testDatePickerLunar001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerLunar001)},
        ani_native_function {"testDatePickerLunar002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerLunar002)},
        ani_native_function {"testDatePickerLunar003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerLunar003)},
        ani_native_function {"testDatePickerLunar004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerLunar004)},
        ani_native_function {"testDatePickerEnd001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerEnd001)},
        ani_native_function {"testDatePickerEnd002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerEnd002)},
        ani_native_function {"testDatePickerEnd003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerEnd003)},
        ani_native_function {"testDatePickerEnd004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerEnd004)},      
        ani_native_function {"testDatePickerStart001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerStart001)},
        ani_native_function {"testDatePickerStart002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerStart002)},
        ani_native_function {"testDatePickerStart003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerStart003)},
        ani_native_function {"testDatePickerStart004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerStart004)},  
        ani_native_function {"testDatePickerSelected001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelected001)},
        ani_native_function {"testDatePickerSelected002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelected002)}, 
        ani_native_function {"testDatePickerSelected003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelected003)},
        ani_native_function {"testDatePickerSelected004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelected004)},       
        ani_native_function {"testDatePickerSelectedTextStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle001)},
        ani_native_function {"testDatePickerSelectedTextStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle002)},    
        ani_native_function {"testDatePickerSelectedTextStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle003)},
        ani_native_function {"testDatePickerSelectedTextStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle004)},
        ani_native_function {"testDatePickerSelectedTextStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle005)},
        ani_native_function {"testDatePickerSelectedTextStyle006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle006)},
        ani_native_function {"testDatePickerSelectedTextStyle007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle007)},
        ani_native_function {"testDatePickerSelectedTextStyle008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle008)},
        ani_native_function {"testDatePickerSelectedTextStyle009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle009)},
        ani_native_function {"testDatePickerSelectedTextStyle010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle010)},
        ani_native_function {"testDatePickerSelectedTextStyle011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle011)},
        ani_native_function {"testDatePickerSelectedTextStyle012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle012)},
        ani_native_function {"testDatePickerSelectedTextStyle013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerSelectedTextStyle013)},        
        ani_native_function {"testDatePickerDisappearTextStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle001)},
        ani_native_function {"testDatePickerDisappearTextStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle002)}, 
        ani_native_function {"testDatePickerDisappearTextStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle003)},
        ani_native_function {"testDatePickerDisappearTextStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle004)},
        ani_native_function {"testDatePickerDisappearTextStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle005)},
        ani_native_function {"testDatePickerDisappearTextStyle006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle006)},
        ani_native_function {"testDatePickerDisappearTextStyle007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle007)},
        ani_native_function {"testDatePickerDisappearTextStyle008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle008)},
        ani_native_function {"testDatePickerDisappearTextStyle009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle009)},
        ani_native_function {"testDatePickerDisappearTextStyle010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle010)},
        ani_native_function {"testDatePickerDisappearTextStyle011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle011)},
        ani_native_function {"testDatePickerDisappearTextStyle012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle012)},
        ani_native_function {"testDatePickerDisappearTextStyle013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerDisappearTextStyle013)}, 
        ani_native_function {"testDatePickerTextStyle001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle001)},
        ani_native_function {"testDatePickerTextStyle002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle002)},    
        ani_native_function {"testDatePickerTextStyle003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle003)},
        ani_native_function {"testDatePickerTextStyle004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle004)},    
        ani_native_function {"testDatePickerTextStyle005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle005)},
        ani_native_function {"testDatePickerTextStyle006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle006)},
        ani_native_function {"testDatePickerTextStyle007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle007)},
        ani_native_function {"testDatePickerTextStyle008", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle008)},
        ani_native_function {"testDatePickerTextStyle009", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle009)},
        ani_native_function {"testDatePickerTextStyle010", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle010)},
        ani_native_function {"testDatePickerTextStyle011", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle011)},
        ani_native_function {"testDatePickerTextStyle012", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle012)},
        ani_native_function {"testDatePickerTextStyle013", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerTextStyle013)},     
        ani_native_function {"testTextPickerAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityDescription001)},
        ani_native_function {"testTextPickerAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityDescription002)},
        ani_native_function {"testTextPickerAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityGroup001)},
        ani_native_function {"testTextPickerAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityGroup002)},
        ani_native_function {"testTextPickerAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityGroup003)},
        ani_native_function {"testTextPickerAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityGroup004)},
        ani_native_function {"testTextPickerAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel001)},
        ani_native_function {"testTextPickerAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel002)},
        ani_native_function {"testTextPickerAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel003)},
        ani_native_function {"testTextPickerAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel004)},
        ani_native_function {"testTextPickerAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel005)},
        ani_native_function {"testTextPickerAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityLevel006)},
        ani_native_function {"testTextPickerAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityText001)},
        ani_native_function {"testTextPickerAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextPickerAccessibilityText002)},    
        ani_native_function {"testTimePickerAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel001)},
        ani_native_function {"testTimePickerAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel002)},
        ani_native_function {"testTimePickerAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel003)},
        ani_native_function {"testTimePickerAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel004)},
        ani_native_function {"testTimePickerAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel005)},
        ani_native_function {"testTimePickerAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityLevel006)},    
        ani_native_function {"testTimePickerAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityText001)},
        ani_native_function {"testTimePickerAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityText002)},    
        ani_native_function {"testTimePickerAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityGroup001)},
        ani_native_function {"testTimePickerAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityGroup002)},
        ani_native_function {"testTimePickerAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityGroup003)},
        ani_native_function {"testTimePickerAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityGroup004)},    
        ani_native_function {"testTimePickerAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityDescription001)},
        ani_native_function {"testTimePickerAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTimePickerAccessibilityDescription002)},    
        ani_native_function {"testDatePickerAccessibilityText001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityText001)},
        ani_native_function {"testDatePickerAccessibilityText002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityText002)},    
        ani_native_function {"testDatePickerAccessibilityLevel001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel001)},
        ani_native_function {"testDatePickerAccessibilityLevel002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel002)},
        ani_native_function {"testDatePickerAccessibilityLevel003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel003)},
        ani_native_function {"testDatePickerAccessibilityLevel004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel004)},
        ani_native_function {"testDatePickerAccessibilityLevel005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel005)},
        ani_native_function {"testDatePickerAccessibilityLevel006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityLevel006)},    
        ani_native_function {"testDatePickerAccessibilityGroup001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityGroup001)},
        ani_native_function {"testDatePickerAccessibilityGroup002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityGroup002)},
        ani_native_function {"testDatePickerAccessibilityGroup003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityGroup003)},
        ani_native_function {"testDatePickerAccessibilityGroup004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityGroup004)},    
        ani_native_function {"testDatePickerAccessibilityDescription001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityDescription001)},
        ani_native_function {"testDatePickerAccessibilityDescription002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestDatePickerAccessibilityDescription002)},    
        ani_native_function {"scrollScrollEventOnWillScrollTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEventTest::CreateNativeNodeOnWillScroll)},
        ani_native_function {"scrollScrollEventOnDidScrollTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEventTest::CreateNativeNodeOnDidScroll)},
        ani_native_function {"scrollScrollEventOnWillDidScrollTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEventTest::CreateNativeNodeOnWillDidScroll)},
        ani_native_function {"scrollScrollEventOnReachStartTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEventTest::CreateNativeNodeOnReachStart)},
        ani_native_function {"scrollScrollEventOnReachEndTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEventTest::CreateNativeNodeOnReachEnd)},
        ani_native_function {"scrollScrollEventScrollBy001Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEventTest::CreateNativeNodeScrollBy001)},
        ani_native_function {"scrollScrollEventScrollBy002Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEventTest::CreateNativeNodeScrollBy002)},
        ani_native_function {"scrollScrollEventScrollBy003Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEventTest::CreateNativeNodeScrollBy003)},
        ani_native_function {"scrollScrollEventScrollBy004Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEventTest::CreateNativeNodeScrollBy004)},
        ani_native_function {"scrollScrollEventScrollBy005Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEventTest::CreateNativeNodeScrollBy005)},
        ani_native_function {"scrollScrollEventScrollBy006Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollScrollEventTest::CreateNativeNodeScrollBy006)},
        ani_native_function {"scrollPageTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ScrollPageTest::CreateNativeNode)},
        ani_native_function {"testScrollBarWidth001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBarWidth001)},
        ani_native_function {"testScrollBarWidth002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBarWidth002)},
        ani_native_function {"testScrollBarWidth003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBarWidth003)},
        ani_native_function {"testScrollBarWidth004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBarWidth004)},
        ani_native_function {"testScrollBarWidth005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBarWidth005)},
        ani_native_function {"testScrollBarWidth006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollBarWidth006)},
        ani_native_function {"listOnScrollTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListEventTest::CreateNativeNodeOnScroll)},
        ani_native_function {"listOnScrollFrameBeginTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListEventTest::CreateNativeNodeOnScrollFrameBegin)},
        ani_native_function {"listOnScrollStartTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListEventTest::CreateNativeNodeOnScrollStart)},
        ani_native_function {"listOnScrollStopTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListEventTest::CreateNativeNodeOnScrollStop)},
        ani_native_function {"listOnWillScrollTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListEventTest::CreateNativeNodeOnWillScroll)},
        ani_native_function {"listOnDidScrollTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListEventTest::CreateNativeNodeOnDidScroll)},
        ani_native_function {"listOnWillDidScrollTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListEventTest::CreateNativeNodeOnWillDidScroll)},
        ani_native_function {"listScrollToIndexTest", "C{arkui.Content.Content}ii:", reinterpret_cast<void *>(ArkUIAniTest::ListEventTest::CreateNativeNodeScrollToIndex)},
        ani_native_function {"listOnReachStartTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListEventTest::CreateNativeNodeOnReachStart)},
        ani_native_function {"listOnReachEndTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListEventTest::CreateNativeNodeOnReachEnd)},
        ani_native_function {"listOnScrollIndexTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListEventTest::CreateNativeNodeOnScrollIndex)},         
        ani_native_function {"listScrollBy001Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollByTest::TestListScrollBy001)},
        ani_native_function {"listScrollBy002Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollByTest::TestListScrollBy002)},
        ani_native_function {"listScrollBy003Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollByTest::TestListScrollBy003)},
        ani_native_function {"listScrollBy004Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollByTest::TestListScrollBy004)},    
        ani_native_function {"listScrollPageTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollPageTest::TestListScrollPage)},
        ani_native_function {"testListScrollEdge001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScrollEdge001)},
        ani_native_function {"testListScrollEdge002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScrollEdge002)},
        ani_native_function {"testListScrollEdge003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScrollEdge003)},
        ani_native_function {"testListScrollEdge004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScrollEdge004)},
        ani_native_function {"testListScrollEdge005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScrollEdge005)},
        ani_native_function {"testListScrollEdge006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScrollEdge006)},
        ani_native_function {"testListScrollEdge007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListScrollEdge007)},    
        ani_native_function {"listScrollOffset001Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset001)},
        ani_native_function {"listScrollOffset002Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset002)},
        ani_native_function {"listScrollOffset003Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset003)},
        ani_native_function {"listScrollOffset004Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset004)},
        ani_native_function {"listScrollOffset005Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset005)},
        ani_native_function {"listScrollOffset006Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset006)},
        ani_native_function {"listScrollOffset007Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset007)},
        ani_native_function {"listScrollOffset008Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset008)},
        ani_native_function {"listScrollOffset009Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset009)},
        ani_native_function {"listScrollOffset010Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset010)},
        ani_native_function {"listScrollOffset011Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset011)},
        ani_native_function {"listScrollOffset012Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset012)},
        ani_native_function {"listScrollOffset013Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset013)},
        ani_native_function {"listScrollOffset014Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset014)},
        ani_native_function {"listScrollOffset015Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset015)},
        ani_native_function {"listScrollOffset016Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset016)},
        ani_native_function {"listScrollOffset017Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset017)},
        ani_native_function {"listScrollOffset018Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset018)},
        ani_native_function {"listScrollOffset019Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset019)},
        ani_native_function {"listScrollOffset020Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset020)},
        ani_native_function {"listScrollOffset021Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset021)},
        ani_native_function {"listScrollOffset022Test", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollOffsetTest::TestListScrollOffset022)},
        ani_native_function {"testLazyForEachGetHostNode002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachGetHostNode002)},
        ani_native_function {"lazyForEachGetHostNodeTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeHostNode)},
        ani_native_function {"testLazyForEachSetItem002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachSetItem002)},
        ani_native_function {"lazyForEachSetNodeIdTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeNodeId)},
        ani_native_function {"testLazyForEachSetNodeId002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachSetNodeId002)},
        ani_native_function {"lazyForEachSetItemTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeSetItem)},
        ani_native_function {"testLazyForEachGetUserData002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachGetUserData002)},
        ani_native_function {"lazyForEachGetUserDataTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeGetUserData)},
        ani_native_function {"testLazyForEachGetType002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachGetType002)},
        ani_native_function {"lazyForEachGetTypeTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeGetType)},
        ani_native_function {"testLazyForEachGetRemovedNode002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachGetRemovedNode002)},
        ani_native_function {"lazyForEachGetRemovedNodeTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeGetRemovedNode)},
        ani_native_function {"testLazyForEachGetItemIndex002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachGetItemIndex002)},
        ani_native_function {"lazyForEachGetItemIndexTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeItemIndex)},
        ani_native_function {"lazyForEachGetAllItemsTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeGetAllItems)},
        ani_native_function {"testLazyForEachInsertItem002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachInsertItem002)},
        ani_native_function {"lazyForEachInsertItemTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeInsertItem)},
        ani_native_function {"testLazyForEachMoveItem002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachMoveItem002)},
        ani_native_function {"lazyForEachMoveItemTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeMoveItem)},
        ani_native_function {"testLazyForEachGetAllItems002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachGetAllItems002)},
        ani_native_function {"testLazyForEachGetAllItems003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachGetAllItems003)},
        ani_native_function {"lazyForEachRemoveItemTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeRemoveItem)},
        ani_native_function {"testLazyForEachRemoveItem002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachRemoveItem002)},
        ani_native_function {"lazyForEachReloadAllItemsTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeReloadAllItems)},
        ani_native_function {"testLazyForEachReloadItem002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachReloadItem002)},
        ani_native_function {"lazyForEachReloadItemTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachTest::CreateNativeNodeReloadItem)},
        ani_native_function {"testLazyForEachReloadAllItems002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachReloadAllItems002)},
        ani_native_function {"testLazyForEachRegisterEventReceiver001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachRegisterEventReceiver001)},
        ani_native_function {"testLazyForEachRegisterEventReceiver002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachRegisterEventReceiver002)},
        ani_native_function {"testLazyForEachRegisterEventReceiver003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachRegisterEventReceiver003)},
        ani_native_function {"testLazyForEachRegisterEventReceiver004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachRegisterEventReceiver004)},    
        ani_native_function {"testLazyForEachDispose001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachDispose001)},
        ani_native_function {"testLazyForEachDispose002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachDispose002)},    
        ani_native_function {"testLazyForEachSetTotalNodeCount001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachSetTotalNodeCount001)},
        ani_native_function {"testLazyForEachSetTotalNodeCount002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachSetTotalNodeCount002)},
        ani_native_function {"testLazyForEachSetTotalNodeCount003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachSetTotalNodeCount003)},
        ani_native_function {"testLazyForEachGetTotalNodeCount001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachGetTotalNodeCount001)},
        ani_native_function {"testLazyForEachUnregisterEventReceiver001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachUnregisterEventReceiver001)},
        ani_native_function {"testLazyForEachUnregisterEventReceiver002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachUnregisterEventReceiver002)},
        ani_native_function {"testLazyForEachUnregisterEventReceiver003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachUnregisterEventReceiver003)},     
        ani_native_function {"testLazyForEachCreate001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachCreate001)},
        ani_native_function {"testLazyForEachSetUserData001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachSetUserData001)},
        ani_native_function {"testLazyForEachSetUserData002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachSetUserData002)},
        ani_native_function {"testLazyForEachSetUserData003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestLazyForEachSetUserData003)},
        ani_native_function {"testScrollShadow001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollShadow001)},
        ani_native_function {"testScrollShadow002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollShadow002)},
        ani_native_function {"testScrollShadow003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollShadow003)},
        ani_native_function {"testScrollShadow004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollShadow004)},
        ani_native_function {"testScrollShadow005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollShadow005)},
        ani_native_function {"testScrollShadow006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestScrollShadow006)},
        ani_native_function {"testListItemShadow001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemShadow001)},
        ani_native_function {"testListItemShadow002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemShadow002)},
        ani_native_function {"testListItemShadow003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemShadow003)},
        ani_native_function {"testListItemShadow004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemShadow004)},
        ani_native_function {"testListItemShadow005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemShadow005)},
        ani_native_function {"testListItemShadow006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListItemShadow006)},
        ani_native_function {"testListShadow001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListShadow001)},
        ani_native_function {"testListShadow002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListShadow002)},
        ani_native_function {"testListShadow003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListShadow003)},
        ani_native_function {"testListShadow004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListShadow004)},
        ani_native_function {"testListShadow005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListShadow005)},
        ani_native_function {"testListShadow006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestListShadow006)},
        ani_native_function {"testImageShadow001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageShadow001)},
        ani_native_function {"testImageShadow002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageShadow002)},
        ani_native_function {"testImageShadow003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageShadow003)},
        ani_native_function {"testImageShadow004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageShadow004)},
        ani_native_function {"testImageShadow005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageShadow005)},
        ani_native_function {"testImageShadow006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestImageShadow006)},
        ani_native_function {"testCommonAttrsShadow001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsShadow001)},
        ani_native_function {"testCommonAttrsShadow002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsShadow002)},
        ani_native_function {"testCommonAttrsShadow003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsShadow003)},
        ani_native_function {"testCommonAttrsShadow004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsShadow004)},
        ani_native_function {"testCommonAttrsShadow005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsShadow005)},
        ani_native_function {"testCommonAttrsShadow006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCommonAttrsShadow006)},
        ani_native_function {"testCustomComponentShadow001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentShadow001)},
        ani_native_function {"testCustomComponentShadow002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentShadow002)},
        ani_native_function {"testCustomComponentShadow003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentShadow003)},
        ani_native_function {"testCustomComponentShadow004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentShadow004)},
        ani_native_function {"testCustomComponentShadow005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentShadow005)},
        ani_native_function {"testCustomComponentShadow006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestCustomComponentShadow006)},
    };
}

static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    OH_LOG_INFO(LOG_APP, " GetEnv strat -> 44");
    //获取环境变量
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        OH_LOG_INFO(LOG_APP, " GetEnv Failed -> 47");
        return (ani_status)9;
    }
    OH_LOG_INFO(LOG_APP, " GetEnv end -> 50");

    ani_class cls{};
    //根据传入的ets侧绑定类的路径查找C侧的实现
    OH_LOG_INFO(LOG_APP, " FindClass start -> 53");
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        OH_LOG_INFO(LOG_APP, " FindClass Failed -> 55");
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return (ani_status)2;
    }
    OH_LOG_INFO(LOG_APP, " FindClass end -> 53");

    OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods start -> 61");
    //将查询到的C侧接口实现与ets侧接口进行绑定
    ani_status status = env->Class_BindNativeMethods(cls, methods.data(), methods.size());
    if (ANI_OK != status) {
        OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods Failed -> 63  status: %{public}d ",status);
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return (ani_status)3;
    };
    OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods end -> 67");
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    OH_LOG_INFO(LOG_APP, " bindCase strat -> 73");
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    //触发绑定接口，参数2“entry.src.main.ets.pages.LibUtil.LibUtil” 为ets侧绑定类的路径，需要追踪到类名，中间用"."隔开，不能用“/”
    bindCase(vm, "entry.src.main.ets.pages.LibUtil.LibUtil");
    OH_LOG_INFO(LOG_APP, " bindCase end -> 76");
    *result = ANI_VERSION_1;
    OH_LOG_INFO(LOG_APP, " bindCase end -> 78");
    return ANI_OK;
}