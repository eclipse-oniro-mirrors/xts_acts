'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import commonAttrsShadowTest from './commonattrs/CommonAttrsShadowTest.test'
import customComponentShadowTest from './customcomponent/CustomComponentShadowTest.test'
import imageShadowTest from './image/ImageShadowTest.test'
import listShadowTest from './list/ListShadowTest.test'
import listItemShadowTest from './listitem/ListItemShadowTest.test'
import scrollShadowTest from './scroll/ScrollShadowTest.test'
import lazyForEachSetUserDataTest from "./lazyforeach/LazyForEachSetUserDataTest.test"
import lazyForEachCreateTest from "./lazyforeach/LazyForEachCreateTest.test"
import lazyForEachDisposeTest from "./lazyforeach/LazyForEachDisposeTest.test"
import lazyForEachSetTotalNodeCountTest from "./lazyforeach/LazyForEachSetTotalNodeCountTest.test"
import lazyForEachGetTotalNodeCountTest from "./lazyforeach/LazyForEachGetTotalNodeCountTest.test"
import lazyForEachRegisterEventReceiverTest from "./lazyforeach/LazyForEachRegisterEventReceiverTest.test"
import lazyForEachUnregisterEventReceiverTest from "./lazyforeach/LazyForEachUnregisterEventReceiverTest.test"
import lazyForEachReloadAllItemsTest from "./lazyforeach/LazyForEachReloadAllItemsTest.test"
import lazyForEachReloadItemTest from "./lazyforeach/LazyForEachReloadItemTest.test"
import lazyForEachRemoveItemTest from "./lazyforeach/LazyForEachRemoveItemTest.test"
import lazyForEachInsertItemTest from "./lazyforeach/LazyForEachInsertItemTest.test"
import lazyForEachMoveItemTest from "./lazyforeach/LazyForEachMoveItemTest.test"
import lazyForEachGetAllItemsTest from "./lazyforeach/LazyForEachGetAllItemsTest.test"
import lazyForEachGetUserDataTest from "./lazyforeach/LazyForEachGetUserDataTest.test"
import lazyForEachGetTypeTest from "./lazyforeach/LazyForEachGetTypeTest.test"
import lazyForEachGetRemovedNodeTest from "./lazyforeach/LazyForEachGetRemovedNodeTest.test"
import lazyForEachSetItemTest from "./lazyforeach/LazyForEachSetItemTest.test"
import lazyForEachSetNodeIdTest from "./lazyforeach/LazyForEachSetNodeIdTest.test"
import listScrollEdgeTest from './list/ListScrollEdgeTest.test'
import scrollBarWidthTest from './scroll/ScrollBarWidthTest.test'
import scrollPageTest from './scroll/ScrollPageTest.test'
import datePickerAccessibilityDescriptionTest from './accessibility/DatePickerAccessibilityDescriptionTest.test'
import datePickerAccessibilityGroupTest from './accessibility/DatePickerAccessibilityGroupTest.test'
import datePickerAccessibilityLevelTest from './accessibility/DatePickerAccessibilityLevelTest.test'
import datePickerAccessibilityTextTest from './accessibility/DatePickerAccessibilityTextTest.test'
import timePickerAccessibilityDescriptionTest from './accessibility/TimePickerAccessibilityDescriptionTest.test'
import timePickerAccessibilityGroupTest from './accessibility/TimePickerAccessibilityGroupTest.test'
import timePickerAccessibilityLevelTest from './accessibility/TimePickerAccessibilityLevelTest.test'
import timePickerAccessibilityTextTest from './accessibility/TimePickerAccessibilityTextTest.test'
import textPickerAccessibilityDescriptionTest from './accessibility/TextPickerAccessibilityDescriptionTest.test'
import textPickerAccessibilityGroupTest from './accessibility/TextPickerAccessibilityGroupTest.test'
import textPickerAccessibilityLevelTest from './accessibility/TextPickerAccessibilityLevelTest.test'
import textPickerAccessibilityTextTest from './accessibility/TextPickerAccessibilityTextTest.test'
import datePickerTextStyleTest from './datepicker/DatePickerTextStyleTest.test'
import datePickerDisappearTextStyleTest from './datepicker/DatePickerDisappearTextStyleTest.test'
import datePickerSelectedTextStyleTest from './datepicker/DatePickerSelectedTextStyleTest.test'
import datePickerSelectedTest from './datepicker/DatePickerSelectedTest.test'
import datePickerStartTest from './datepicker/DatePickerStartTest.test'
import datePickerEndTest from './datepicker/DatePickerEndTest.test'
import datePickerLunarTest from './datepicker/DatePickerLunarTest.test'
import datePickerWidthTest from './datepicker/DatePickerWidthTest.test'
import buttonFontSizeTest from './button/ButtonFontSizeTest.test'
import buttonFontColorTest from './button/ButtonFontColorTest.test'
import buttonFontWeightTest from './button/ButtonFontWeightTest.test'
import buttonBackgroundColorTest from './button/ButtonBackgroundColorTest.test'
import buttonLabelTest from './button/ButtonLabelTest.test'
import buttonTypeTest from './button/ButtonTypeTest.test'
import checkboxSelectTest from './checkbox/CheckboxSelectTest.test'
import checkboxSelectedColorTest from './checkbox/CheckboxSelectedColorTest.test'
import checkboxUnselectedColorTest from './checkbox/CheckboxUnselectedColorTest.test'
import checkboxMarkTest from './checkbox/CheckboxMarkTest.test'
import checkboxShapeTest from './checkbox/CheckboxShapeTest.test'
import sliderBlockColorTest from './slider/SliderBlockColorTest.test'
import sliderBlockStyleTest from './slider/SliderBlockStyleTest.test'
import sliderDirectionTest from './slider/SliderDirectionTest.test'
import sliderMaxTest from './slider/SliderMaxTest.test'
import sliderMinTest from './slider/SliderMinTest.test'
import sliderReverseTest from './slider/SliderReverseTest.test'
import sliderSelectedColorTest from './slider/SliderSelectedColorTest.test'
import sliderShowStepsTest from './slider/SliderShowStepsTest.test'
import sliderStepTest from './slider/SliderStepTest.test'
import sliderStyleTest from './slider/SliderStyleTest.test'
import sliderTrackColorTest from './slider/SliderTrackColorTest.test'
import sliderTrackThicknessTest from './slider/SliderTrackThicknessTest.test'
import sliderValueTest from './slider/SliderValueTest.test'
import loadingProgressColorTest from './loadingprogress/LoadingProgressColorTest'
import loadingProgressEnableLoadingTest from './loadingprogress/LoadingProgressEnableLoadingTest'
import progressColorTest from './progress/ProgressColorTest'
import progressBackGroundColorTest from './progress/ProgressBackgroundColorTest'
import progressStyleTest from './progress/ProgressStyleTest'
import progressTotalTest from './progress/ProgressTotalTest.test'
import progressValueTest from './progress/ProgressValueTest.test'
import progressTypeTest from './progress/ProgressTypeTest.test'
import refreshOffsetTest from './refresh/RefreshOffsetTest.test'
import refreshPullDownRatioTest from './refresh/RefreshPullDownRatioTest.test'
import refreshPullToRefreshTest from './refresh/RefreshPullToRefreshTest.test'
import refreshRefreshingTest from './refresh/RefreshRefreshingTest.test'
import refreshContentTest from './refresh/RefreshContentTest.test'
import swiperAccessibilityDescriptionTest from './accessibility/SwiperAccessibilityDescriptionTest.test'
import swiperAccessibilityGroupTest from './accessibility/SwiperAccessibilityGroupTest.test'
import swiperAccessibilityLevelTest from './accessibility/SwiperAccessibilityLevelTest.test'
import swiperAccessibilityTextTest from './accessibility/SwiperAccessibilityTextTest.test'
import scrollAccessibilityDescriptionTest from './accessibility/ScrollAccessibilityDescriptionTest.test'
import scrollAccessibilityGroupTest from './accessibility/ScrollAccessibilityGroupTest.test'
import scrollAccessibilityLevelTest from './accessibility/ScrollAccessibilityLevelTest.test'
import scrollAccessibilityTextTest from './accessibility/ScrollAccessibilityTextTest.test'
import listAccessibilityDescriptionTest from './accessibility/ListAccessibilityDescriptionTest.test'
import listAccessibilityGroupTest from './accessibility/ListAccessibilityGroupTest.test'
import listAccessibilityTextTest from './accessibility/ListAccessibilityTextTest.test'
import listAccessibilityLevelTest from './accessibility/ListAccessibilityLevelTest.test'
import toggleAccessibilityDescriptionTest from './accessibility/ToggleAccessibilityDescriptionTest.test'
import toggleAccessibilityGroupTest from './accessibility/ToggleAccessibilityGroupTest.test'
import toggleAccessibilityLevelTest from './accessibility/ToggleAccessibilityLevelTest.test'
import toggleAccessibilityTextTest from './accessibility/ToggleAccessibilityTextTest.test'
import textAccessibilityDescriptionTest from './accessibility/TextAccessibilityDescriptionTest.test'
import textAccessibilityGroupTest from './accessibility/TextAccessibilityGroupTest.test'
import textAccessibilityLevelTest from './accessibility/TextAccessibilityLevelTest.test'
import textAccessibilityTextTest from './accessibility/TextAccessibilityTextTest.test'
import refreshAccessibilityDescriptionTest from './accessibility/RefreshAccessibilityDescriptionTest.test'
import refreshAccessibilityGroupTest from './accessibility/RefreshAccessibilityGroupTest.test'
import refreshAccessibilityLevelTest from './accessibility/RefreshAccessibilityLevelTest.test'
import refreshAccessibilityTextTest from './accessibility/RefreshAccessibilityTextTest.test'
import datePickerAccessibilityDescriptionTest from './accessibility/DatePickerAccessibilityDescriptionTest.test'
import datePickerAccessibilityGroupTest from './accessibility/DatePickerAccessibilityGroupTest.test'
import datePickerAccessibilityLevelTest from './accessibility/DatePickerAccessibilityLevelTest.test'
import datePickerAccessibilityTextTest from './accessibility/DatePickerAccessibilityTextTest.test'
import timePickerAccessibilityDescriptionTest from './accessibility/TimePickerAccessibilityDescriptionTest.test'
import timePickerAccessibilityGroupTest from './accessibility/TimePickerAccessibilityGroupTest.test'
import timePickerAccessibilityLevelTest from './accessibility/TimePickerAccessibilityLevelTest.test'
import timePickerAccessibilityTextTest from './accessibility/TimePickerAccessibilityTextTest.test'
import sliderAccessibilityDescriptionTest from './accessibility/SliderAccessibilityDescriptionTest.test'
import sliderAccessibilityGroupTest from './accessibility/SliderAccessibilityGroupTest.test'
import sliderAccessibilityLevelTest from './accessibility/SliderAccessibilityLevelTest.test'
import sliderAccessibilityTextTest from './accessibility/SliderAccessibilityTextTest.test'
import buttonAccessibilityDescriptionTest from './accessibility/ButtonAccessibilityDescriptionTest.test'
import buttonAccessibilityGroupTest from './accessibility/ButtonAccessibilityGroupTest.test'
import buttonAccessibilityLevelTest from './accessibility/ButtonAccessibilityLevelTest.test'
import buttonAccessibilityTextTest from './accessibility/ButtonAccessibilityTextTest.test'
import textPickerAccessibilityDescriptionTest from './accessibility/TextPickerAccessibilityDescriptionTest.test'
import textPickerAccessibilityGroupTest from './accessibility/TextPickerAccessibilityGroupTest.test'
import textPickerAccessibilityLevelTest from './accessibility/TextPickerAccessibilityLevelTest.test'
import textPickerAccessibilityTextTest from './accessibility/TextPickerAccessibilityTextTest.test'
import checkboxAccessibilityDescriptionTest from './accessibility/CheckboxAccessibilityDescriptionTest.test'
import checkboxAccessibilityGroupTest from './accessibility/CheckboxAccessibilityGroupTest.test'
import checkboxAccessibilityLevelTest from './accessibility/CheckboxAccessibilityLevelTest.test'
import checkboxAccessibilityTextTest from './accessibility/CheckboxAccessibilityTextTest.test'
import progressAccessibilityDescriptionTest from './accessibility/ProgressAccessibilityDescriptionTest.test'
import progressAccessibilityGroupTest from './accessibility/ProgressAccessibilityGroupTest.test'
import progressAccessibilityLevelTest from './accessibility/ProgressAccessibilityLevelTest.test'
import progressAccessibilityTextTest from './accessibility/ProgressAccessibilityTextTest.test'
import customComponentAccessibilityDescriptionTest from './customcomponent/CustomComponentAccessibilityDescriptionTest.test'
import customComponentAccessibilityLevelTest from './customcomponent/CustomComponentAccessibilityLevelTest.test'
import customComponentAccessibilityTextTest from './customcomponent/CustomComponentAccessibilityTextTest.test'
import customComponentAccessibilityGroupTest from './customcomponent/CustomComponentAccessibilityGroupTest.test'
import customComponentAlignSelfTest from './customcomponent/CustomComponentAlignSelfTest.test'
import customComponentFlexGrowTest from './customcomponent/CustomComponentFlexGrowTest.test'
import customComponentFlexBasisTest from './customcomponent/CustomComponentFlexBasisTest.test'
import customComponentFlexShrinkTest from './customcomponent/CustomComponentFlexShrinkTest.test'
import customComponentBackgroundColorTest from './customcomponent/CustomComponentBackgroundColorTest.test'
import customComponentBorderColorTest from './customcomponent/CustomComponentBorderColorTest.test'
import customComponentBorderRadiusTest from './customcomponent/CustomComponentBorderRadiusTest.test'
import customComponentBorderStyleTest from './customcomponent/CustomComponentBorderStyleTest.test'
import customComponentBorderWidthTest from './customcomponent/CustomComponentBorderWidthTest.test'
import customComponentForegroundBlurStyleTest from './customcomponent/CustomComponentForegroundBlurStyleTest.test'
import customComponentWidthTest from './customcomponent/CustomComponentWidthTest.test'
import customComponentHeightTest from './customcomponent/CustomComponentHeightTest.test'
import customComponentPositionTest from './customcomponent/CustomComponentPositionTest.test'
import customComponentSweepGradientTest from './customcomponent/CustomComponentSweepGradientTest.test'
import customComponentRadialGradientTest from './customcomponent/CustomComponentRadialGradientTest.test'
import customComponentTransformTest from './customcomponent/CustomComponentTransformTest.test'
import customComponentMaskTest from './customcomponent/CustomComponentMaskTest.test'
import customComponentBlendModeTest from './customcomponent/CustomComponentBlendModeTest.test'
import customComponentClipTest from './customcomponent/CustomComponentClipTest.test'
import customComponentLinearGradientTest from './customcomponent/CustomComponentLinearGradientTest.test'
import customComponentScaleTest from './customcomponent/CustomComponentScaleTest.test'
import customComponentMarginTest from './customcomponent/CustomComponentMarginTest.test'
import customComponentConstraintSizeTest from './customcomponent/CustomComponentConstraintSizeTest.test'
import customComponentContrastTest from './customcomponent/CustomComponentContrastTest.test'
import customComponentGrayscaleTest from './customcomponent/CustomComponentGrayscaleTest.test'
import customComponentInvertTest from './customcomponent/CustomComponentInvertTest.test'
import customComponentOpacityTest from './customcomponent/CustomComponentOpacityTest.test'
import customComponentSepiaTest from './customcomponent/CustomComponentSepiaTest.test'
import customComponentAlignTest from './customcomponent/CustomComponentAlignTest.test'
import customComponentDirectionTest from './customcomponent/CustomComponentDirectionTest.test'
import customDialogMaskColorTest from './customdialog/CustomDialogMaskColorTest.test'
import commonAttrsAlignSelfTest from './commonattrs/CommonAttrsAlignSelfTest.test'
import commonAttrsAlignItemsTest from './commonattrs/CommonAttrsAlignItemsTest.test'
import commonAttrsAlignContentTest from './commonattrs/CommonAttrsAlignContentTest.test'
import commonAttrsFlexGrowTest from './commonattrs/CommonAttrsFlexGrowTest.test'
import commonAttrsFlexBasisTest from './commonattrs/CommonAttrsFlexBasisTest.test'
import commonAttrsFlexShrinkTest from './commonattrs/CommonAttrsFlexShrinkTest.test'
import commonAttrsJustifyContentTest from './commonattrs/CommonAttrsJustifyContentTest.test'
import commonAttrsWidthTest from './commonattrs/CommonAttrsWidthTest.test'
import commonAttrsHeightTest from './commonattrs/CommonAttrsHeightTest.test'
import commonAttrsBackgroundColorTest from './commonattrs/CommonAttrsBackgroundColorTest.test'
import commonAttrsPositionTest from './commonattrs/CommonAttrsPositionTest.test'
import commonAttrsBorderWidthTest from './commonattrs/CommonAttrsBorderWidthTest.test'
import commonAttrsBorderColorTest from './commonattrs/CommonAttrsBorderColorTest.test'
import commonAttrsBorderRadiusTest from './commonattrs/CommonAttrsBorderRadiusTest.test'
import commonAttrsBorderStyleTest from './commonattrs/CommonAttrsBorderStyleTest.test'
import commonAttrsRadialGradientTest from './commonattrs/CommonAttrsRadialGradientTest.test'
import commonAttrsSweepGradientTest from './commonattrs/CommonAttrsSweepGradientTest.test'
import commonAttrsTransformTest from './commonattrs/CommonAttrsTransformTest.test'
import commonAttrsMaskTest from './commonattrs/CommonAttrsMaskTest.test'
import commonAttrsBlendModeTest from './commonattrs/CommonAttrsBlendModeTest.test'
import commonAttrsForegroundBlurStyleTest from './commonattrs/CommonAttrsForegroundBlurStyleTest.test'
import commonAttrsClipTest from './commonattrs/CommonAttrsClipTest.test'
import commonAttrsLinearGradientTest from './commonattrs/CommonAttrsLinearGradientTest.test'
import commonAttrsScaleTest from './commonattrs/CommonAttrsScaleTest.test'
import commonAttrsMarginTest from './commonattrs/CommonAttrsMarginTest.test'
import commonAttrsConstraintSizeTest from './commonattrs/CommonAttrsConstraintSizeTest.test'
import commonAttrsContrastTest from './commonattrs/CommonAttrsContrastTest.test'
import commonAttrsGrayscaleTest from './commonattrs/CommonAttrsGrayscaleTest.test'
import commonAttrsInvertTest from './commonattrs/CommonAttrsInvertTest.test'
import commonAttrsOpacityTest from './commonattrs/CommonAttrsOpacityTest.test'
import commonAttrsSepiaTest from './commonattrs/CommonAttrsSepiaTest.test'
import imageAltTest from './image/ImageAltTest.test'
import imageAutoResizeTest from './image/ImageAutoResizeTest.test'
import imageBackgroundColorTest from './image/ImageBackgroundColorTest.test'
import imageBlurTest from './image/ImageBlurTest.test'
import imageBorderColorTest from './image/ImageBorderColorTest.test'
import imageBorderRadiusTest from './image/ImageBorderRadiusTest.test'
import imageBorderStyleTest from './image/ImageBorderStyleTest.test'
import imageBorderWidthTest from './image/ImageBorderWidthTest.test'
import imageBrightnessTest from './image/ImageBrightnessTest.test'
import imageClipTest from './image/ImageClipTest.test'
import imageColorFilterTest from './image/ImageColorFilterTest.test'
import imageInterpolationTest from './image/ImageInterpolationTest.test'
import imageLinearGradientTest from './image/ImageLinearGradientTest.test'
import imageObjectFitTest from './image/ImageObjectFitTest.test'
import imageObjectRepeatTest from './image/ImageObjectRepeatTest.test'
import imageOpacityTest from './image/ImageOpacityTest.test'
import imageRadialGradientTest from './image/ImageRadialGradientTest.test'
import imageRotateTest from './image/ImageRotateTest.test'
import imageSaturateTest from './image/ImageSaturateTest.test'
import imageScaleTest from './image/ImageScaleTest.test'
import imageSweepGradientTest from './image/ImageSweepGradientTest.test'
import imageTransformTest from './image/ImageTransformTest.test'
import imageTranslateTest from './image/ImageTranslateTest.test'
import listHeightTest from './list/ListHeightTest.test'
import listWidthTest from './list/ListWidthTest.test'
import ListSwipeChildMinSizeTest from './list/ListSwipeChildMinSizeTest.test'
import listBackgroundColorTest from './list/ListBackgroundColorTest.test'
import listBorderWidthTest from './list/ListBorderWidthTest.test'
import listBorderColorTest from './list/ListBorderColorTest.test'
import listBorderRadiusTest from './list/ListBorderRadiusTest.test'
import listOpacityTest from './list/ListOpacityTest.test'
import listClipTest from './list/ListClipTest.test'
import listTranslateTest from './list/ListTranslateTest.test'
import listScaleTest from './list/ListScaleTest.test'
import listBrightnessTest from './list/ListBrightnessTest.test'
import listRotateTest from './list/ListRotateTest.test'
import listSaturateTest from './list/ListSaturateTest.test'
import listBlurTest from './list/ListBlurTest.test'
import listScrollBarTest from './list/ListScrollBarTest.test'
import listCachedCountTest from './list/ListCachedCountTest.test'
import listFrictionTest from './list/ListFrictionTest.test'
import listStickyTest from './list/ListStickyTest.test'
import listListDirectionTest from './list/ListListDirectionTest.test'
import listLinearGradientTest from './list/ListLinearGradientTest.test'
import listEdgeEffectTest from './list/ListEdgeEffectTest.test'
import listEnableScrollInteractionTest from './list/ListEnableScrollInteractionTest.test'
import ListNodeAdapterTest from './list/ListNodeAdapterTest.test'
import ListNodeAdapterEventTest from './list/ListNodeAdapterEventTest.test'
import listItemClipTest from './listitem/ListItemClipTest.test'
import listItemOpacityTest from './listitem/ListItemOpacityTest.test'
import listItemBorderRadiusTest from './listitem/ListItemBorderRadiusTest.test'
import listItemBorderColorTest from './listitem/ListItemBorderColorTest.test'
import listItemBorderWidthTest from './listitem/ListItemBorderWidthTest.test'
import listItemBackgroundColorTest from './listitem/ListItemBackgroundColorTest.test'
import listItemWidthTest from './listitem/ListItemWidthTest.test'
import listItemHeightTest from './listitem/ListItemHeightTest.test'
import listItemLinearGradientTest from './listitem/ListItemLinearGradientTest.test'
import listItemBlurTest from './listitem/ListItemBlurTest.test'
import listItemBrightnessTest from './listitem/ListItemBrightnessTest.test'
import listItemScaleTest from './listitem/ListItemScaleTest.test'
import listItemTranslateTest from './listitem/ListItemTranslateTest.test'
import listItemRotateTest from './listitem/ListItemRotateTest.test'
import listItemSaturateTest from './listitem/ListItemSaturateTest.test'
import scrollWidthTest from './scroll/ScrollWidthTest.test'
import scrollHeightTest from './scroll/ScrollHeightTest.test'
import scrollPositionTest from './scroll/ScrollPositionTest.test'
import imageWidthTest from './image/ImageWidthTest.test'
import imageHeightTest from './image/ImageHeightTest.test'
import imagePositionTest from './image/ImagePositionTest.test'
import scrollScrollBarTest from './scroll/ScrollScrollBarTest.test'
import scrollScrollBarColorTest from './scroll/ScrollScrollBarColorTest.test'
import scrollEnableScrollInteractionTest from './scroll/ScrollEnableScrollInteractionTest'
import scrollClipTest from './scroll/ScrollClipTest'
import scrollBackgroundColorTest from './scroll/ScrollBackgroundColorTest'
import scrollBorderWidthTest from './scroll/ScrollBorderWidthTest'
import scrollBorderColorTest from './scroll/ScrollBorderColorTest'
import scrollBorderRadiusTest from './scroll/ScrollBorderRadiusTest'
import scrollScrollAbleTest from './scroll/ScrollScrollAbleTest'
import scrollOpacityTest from './scroll/ScrollOpacityTest.test'
import scrollTranslateTest from './scroll/ScrollTranslateTest.test'
import scrollScaleTest from './scroll/ScrollScaleTest.test'
import scrollRotateTest from './scroll/ScrollRotateTest.test'
import scrollBrightnessTest from './scroll/ScrollBrightnessTest.test'
import scrollBlurTest from './scroll/ScrollBlurTest'
import scrollEdgeEffectTest from './scroll/ScrollEdgeEffectTest.test'
import scrollFrictionTest from './scroll/ScrollFrictionTest'
import scrollScrollSnapTest from './scroll/ScrollScrollSnapTest.test'
import scrollOverlayTest from './scroll/ScrollOverlayTest.test'
import scrollLinearGradientTest from './scroll/ScrollLinearGradientTest'
import scrollSaturateTest from './scroll/ScrollSaturateTest'
import scrollPageEnableTest from './scroll/ScrollPageEnableTest'
import customDialogOpenTest from './customdialog/CustomDialogOpenTest.test'
import customDialogCloseTest from './customdialog/CustomDialogCloseTest.test'
import customDialogAlignmentTest from './customdialog/CustomDialogAlignmentTest.test'
import customDialogCustomStyleTest from './customdialog/CustomDialogCustomStyleTest.test'
import imageSpanWidthTest from './imagespan/ImageSpanWidthTest.test'
import imageSpanHeightTest from './imagespan/ImageSpanHeightTest.test'
import imageSpanObjectFitTest from './imagespan/ImageSpanObjectFitTest.test'
import imageSpanVerticalAlignTest from './imagespan/ImageSpanVerticalAlignTest.test'
import imageSpanPaddingTest from './imagespan/ImageSpanPaddingTest.test'
import spanDecorationTest from './span/SpanDecorationTest.test'
import spanTextCaseTest from './span/SpanTextCaseTest.test'
import spanLetterSpacingTest from './span/SpanLetterSpacingTest.test'
import spanLineHeightTest from './span/SpanLineHeightTest.test'
import spanFontColorTest from './span/SpanFontColorTest.test'
import spanFontSizeTest from './span/SpanFontSizeTest.test'
import spanFontStyleTest from './span/SpanFontStyleTest.test'
import spanFontWeightTest from './span/SpanFontWeightTest.test'
import spanContentTest from './span/SpanContentTest.test'
import checkboxWidthTest from './checkbox/CheckboxWidthTest.test'
import checkboxHeightTest from './checkbox/CheckboxHeightTest.test'
import flexWidthTest from './flex/FlexWidthTest.test'
import flexHeightTest from './flex/FlexHeightTest.test'
import flexOptionTest from './flex/FlexOptionTest.test'
import columnWidthTest from './column/ColumnWidthTest.test'
import columnHeightTest from './column/ColumnHeightTest.test'
import rowHeightTest from './row/RowHeightTest.test'
import rowJustifyContentTest from './row/RowJustifyContentTest.test'
import rowAlignItemsTest from './row/RowAlignItemsTest.test'
import sliderWidthTest from './slider/SliderWidthTest.test'
import sliderHeightTest from './slider/SliderHeightTest.test'
import columnPaddingTest from './column/ColumnPaddingTest.test'
import columnJustifyContentTest from './column/ColumnJustifyContentTest.test'
import columnAlignItemsTest from './column/ColumnAlignItemsTest.test'
import columnForegroundBlurStyleTest from './column/ColumnForegroundBlurStyleTest.test'
import commonAttrsHitTestBehaviorTest from './commonattrs/CommonAttrsHitTestBehaviorTest.test'
import commonAttrsAlignTest from './commonattrs/CommonAttrsAlignTest.test'
import commonAttrsDirectionTest from './commonattrs/CommonAttrsDirectionTest.test'
import commonAttrsEnabledTest from './commonattrs/CommonAttrsEnabledTest.test'
import commonAttrsFocusableTest from './commonattrs/CommonAttrsFocusableTest.test'
import commonEventOnFocusTest from './commonevent/CommonEventOnFocusTest.test'
import commonEventOnBlurTest from './commonevent/CommonEventOnBlurTest.test'
import commonEventOnAppearTest from './commonevent/CommonEventOnAppearTest.test'
import commonEventOnTouchTest from './commonevent/CommonEventOnTouchTest.test'
import PointEventOnTouchTest from './commonevent/PointEventOnTouchTest.test'
import imageOnCompleteTest from './image/ImageOnCompleteTest.test'
import imageOnErrorTest from './image/ImageOnErrorTest.test'
import listHitTestBehaviorTest from './list/ListHitTestBehaviorTest.test'
import listItemHitTestBehaviorTest from './listitem/ListItemHitTestBehaviorTest.test'
import ListSwipeActionItemTest from './list/ListSwipeActionItemTest.test'
import scrollOnScrollTest from './scroll/ScrollOnScrollTest.test'
import scrollOnScrollFrameBeginTest from './scroll/ScrollOnScrollFrameBeginTest.test'
import scrollOnScrollStartTest from './scroll/ScrollOnScrollStartTest.test'
import scrollOnScrollStopTest from './scroll/ScrollOnScrollStopTest.test'
import scrollOnAppearTest from './scroll/ScrollOnAppearTest.test'
import scrollOnScrollEdgeTest from './scroll/ScrollOnScrollEdgeTest.test'
import SliderColorTest from './slider/SliderColorTest.test'
import datePickerOnDateChangeTest from './datepicker/DatePickerOnDateChangeTest.test'
import checkboxEnabledTest from './checkbox/CheckboxEnabledTest.test'
import checkboxOnChangeTest from './checkbox/CheckboxOnChangeTest.test'
import customComponentEnabledTest from './customcomponent/CustomComponentEnabledTest.test'
import customComponentFocusableTest from './customcomponent/CustomComponentFocusableTest.test'
import customComponentHitTestBehaviorTest from './customcomponent/CustomComponentHitTestBehaviorTest.test'
import customComponentOnClickTest from './customcomponent/CustomComponentOnClickTest.test'
import customComponentOnFocusTest from './customcomponent/CustomComponentOnFocusTest.test'
import customComponentOnBlurTest from './customcomponent/CustomComponentOnBlurTest.test'
import customComponentOnAppearTest from './customcomponent/CustomComponentOnAppearTest.test'
import customComponentOnTouchTest from './customcomponent/CustomComponentOnTouchTest.test'
import sliderOnChangeTest from './slider/SliderOnChangeTest.test'
import buttonOnClickTest from './button/ButtonOnClickTest.test'
import customComponentOnMeasureTest from './customcomponent/CustomComponentOnMeasureTest.test'
import customComponentOnLayoutTest from './customcomponent/CustomComponentOnLayoutTest.test'
import customComponentOnDrawTest from './customcomponent/CustomComponentOnDrawTest.test'
import scrollCurrentOffsetTest from './scroll/ScrollCurrentOffsetTest.test'
import TestArkUIAddApi from './arkApi/arkApi.test'
import testAnimationTest from './animation/animationTest.test'
import accessibilityStateTest from './accessibilityState/accessibilityStateTest.test'
import relativeContainerGuidelineTest from "./relativecontainer/RelativeContainerGuidelineTest.test"
import relativeContainerBarrierTest from "./relativecontainer/RelativeContainerBarrierTest.test"
import relativecontaineAlignmentRuleOptionAdditionTest from './relativecontainer/RelativeContainerAlignmentRuleOptionAdditionTest.test'
import relativecontaineAlignmentRuleOptionTest from './relativecontaine/RelativeContaineAlignmentRuleOptionTest.test'
import relativecontaineBarrierOptionTest from './relativecontaine/RelativeContaineBarrierOptionTest.test'
import gestureGestureAttrsTest from './gesture/GestureGestureAttrsTest.test'
import gestureGestureInterrupterTest from './gesture/GestureGestureInterrupterTest.test'
import gestureCreateGestureTest from './gesture/GestureCreateGestureTest.test'
import gridColumnGapTest from './grid/GridColumnGapTest.test'
import gridRowsTemplateTest from './grid/GridRowsTemplateTest.test'
import gridColumnTemplateTest from './grid/GridColumnTemplateTest.test'
import gridRowsGapTest from './grid/GridRowsGapTest.test'
import gridCachedCountTest from './grid/GridCachedCountTest.test'
import radioValueTest from './radio/RadioValueTest.test'
import radioGroupTest from './radio/RadioGroupTest.test'
import radioRadioStyleTest from './radio/RadioRadioStyleTest.test'
import radioCheckedTest from './radio/RadioCheckedTest.test'
import customComponentEventTest from './customcomponent/CustomComponentEventTest.test'
import commonAttrsAnimateTest from './commonattrs/CommonAttrsAnimateTest.test'
import drawableDescriptorCreateTest from './drawabledescriptor/DrawableDescriptorCreateTest.test'
import nodeContentTest from './nodecontent/NodeContentTest.test'
import nativeXComponentTest from './nativexcomponent/NativeXComponentTest.test'
import mouseEventTest from './mouseevent/MouseEventTest.test'
import pointerEventTest from './pointerevent/PointerEventTest.test'
import nativeTest from './native/nativeTest.test'
import DragGetDragEventTest from "./drag/DragGetDragEvent.test"
import DragEventGetDataTypesTest from "./drag/DragEventGetDataTypes.test"
import DragSetGetUdmfDataTest from "./drag/DragSetGetUdmfData.test"
import DragSetDragEventStrictReportTest from "./drag/DragSetDragEventStrictReport.test"
import DragAllowDropDataTypesTest from "./drag/DragAllowDropDataTypes.test"
import DragDragPreviewOptionTest from "./drag/DragDragPreviewOption.test"

export default function testsuite() {
  customComponentEventTest()
  DragDragPreviewOptionTest()
  commonAttrsAnimateTest()
  drawableDescriptorCreateTest()
  nodeContentTest()
  nativeXComponentTest()
  mouseEventTest()
  pointerEventTest()
  nativeTest()
  DragGetDragEventTest()
  DragEventGetDataTypesTest()
  DragSetGetUdmfDataTest()
  DragSetDragEventStrictReportTest()
  DragAllowDropDataTypesTest()
  gridColumnGapTest()
  gridRowsTemplateTest()
  gridColumnTemplateTest()
  gridRowsGapTest()
  gridCachedCountTest()
  radioValueTest()
  radioGroupTest()
  radioRadioStyleTest()
  radioCheckedTest()
  gestureGestureAttrsTest()
  gestureGestureInterrupterTest()
  testAnimationTest()
  accessibilityStateTest()
  relativeContainerGuidelineTest()
  relativeContainerBarrierTest()
  relativecontaineAlignmentRuleOptionAdditionTest()
  relativecontaineAlignmentRuleOptionTest()
  relativecontaineBarrierOptionTest()
  TestArkUIAddApi()
  customComponentHitTestBehaviorTest()
  customComponentEnabledTest()
  customComponentFocusableTest()
  customComponentOnAppearTest()
  customComponentOnBlurTest()
  customComponentOnFocusTest()
  customComponentOnTouchTest()
  customComponentOnClickTest()
  sliderOnChangeTest()
  customComponentOnMeasureTest()
  customComponentOnLayoutTest()
  customComponentOnDrawTest()
  scrollCurrentOffsetTest()
  buttonOnClickTest()
  checkboxEnabledTest()
  checkboxOnChangeTest()
  scrollOnScrollTest()
  scrollOnScrollFrameBeginTest()
  scrollOnScrollStartTest()
  scrollOnScrollStopTest()
  scrollOnAppearTest()
  scrollOnScrollEdgeTest()
  listHitTestBehaviorTest()
  listItemHitTestBehaviorTest()
  ListSwipeActionItemTest()
  datePickerOnDateChangeTest()
  PointEventOnTouchTest()
  imageOnCompleteTest()
  imageOnErrorTest()
  commonAttrsHitTestBehaviorTest()
  commonAttrsAlignTest()
  commonAttrsDirectionTest()
  commonAttrsEnabledTest()
  commonAttrsFocusableTest()
  commonEventOnAppearTest()
  commonEventOnBlurTest()
  commonEventOnFocusTest()
  commonEventOnTouchTest()
  columnWidthTest()
  columnHeightTest()
  rowHeightTest()
  rowJustifyContentTest()
  rowAlignItemsTest()
  sliderWidthTest()
  sliderHeightTest()
  columnPaddingTest()
  columnJustifyContentTest()
  columnAlignItemsTest()
  columnForegroundBlurStyleTest()
  customDialogCustomStyleTest()
  customDialogAlignmentTest()
  customDialogCloseTest()
  customDialogOpenTest()
  imageSpanWidthTest()
  imageSpanHeightTest()
  imageSpanObjectFitTest()
  imageSpanVerticalAlignTest()
  imageSpanPaddingTest()
  spanDecorationTest()
  spanTextCaseTest()
  spanLetterSpacingTest()
  spanLineHeightTest()
  spanFontColorTest()
  spanFontSizeTest()
  spanFontStyleTest()
  spanFontWeightTest()
  spanContentTest()
  checkboxWidthTest()
  checkboxHeightTest()
  flexWidthTest()
  flexHeightTest()
  flexOptionTest()
  scrollScrollBarTest()
  scrollScrollBarColorTest()
  scrollEnableScrollInteractionTest()
  scrollClipTest()
  scrollBackgroundColorTest()
  scrollBorderWidthTest()
  scrollBorderColorTest()
  scrollBorderRadiusTest()
  scrollScrollAbleTest()
  scrollOpacityTest()
  scrollTranslateTest()
  scrollScaleTest()
  scrollRotateTest()
  scrollBrightnessTest()
  scrollBlurTest()
  scrollEdgeEffectTest()
  scrollFrictionTest()
  scrollScrollSnapTest()
  scrollOverlayTest()
  scrollLinearGradientTest()
  scrollSaturateTest()
  scrollPageEnableTest()
  imageWidthTest()
  imageHeightTest()
  imagePositionTest()
  scrollWidthTest()
  scrollHeightTest()
  scrollPositionTest()
  listItemHeightTest()
  listItemWidthTest()
  listItemBackgroundColorTest()
  listItemBorderWidthTest()
  listItemBorderColorTest()
  listItemBorderRadiusTest()
  listItemOpacityTest()
  listItemClipTest()
  listItemTranslateTest()
  listItemScaleTest()
  listItemRotateTest()
  listItemBrightnessTest()
  listItemSaturateTest()
  listItemBlurTest()
  listItemLinearGradientTest()
  listHeightTest()
  listWidthTest()
  ListSwipeChildMinSizeTest()
  listBackgroundColorTest()
  listBorderWidthTest()
  listBorderColorTest()
  listBorderRadiusTest()
  listOpacityTest()
  listClipTest()
  listTranslateTest()
  listScaleTest()
  listRotateTest()
  listBrightnessTest()
  listSaturateTest()
  listBlurTest()
  listScrollBarTest()
  listLinearGradientTest()
  listListDirectionTest()
  listStickyTest()
  listFrictionTest()
  listCachedCountTest()
  listEdgeEffectTest()
  listEnableScrollInteractionTest()
  ListNodeAdapterTest()
  ListNodeAdapterEventTest()
  imageAltTest()
  imageAutoResizeTest()
  imageBackgroundColorTest()
  imageBlurTest()
  imageBorderColorTest()
  imageBorderRadiusTest()
  imageBorderStyleTest()
  imageBorderWidthTest()
  imageBrightnessTest()
  imageClipTest()
  imageColorFilterTest()
  imageInterpolationTest()
  imageLinearGradientTest()
  imageObjectRepeatTest()
  imageOpacityTest()
  imageRadialGradientTest()
  imageRotateTest()
  imageSaturateTest()
  imageScaleTest()
  imageSweepGradientTest()
  imageTransformTest()
  imageTranslateTest()
  commonAttrsAlignSelfTest()
  commonAttrsAlignItemsTest()
  commonAttrsAlignContentTest()
  commonAttrsFlexGrowTest()
  commonAttrsFlexBasisTest()
  commonAttrsFlexShrinkTest()
  commonAttrsJustifyContentTest()
  commonAttrsWidthTest()
  commonAttrsHeightTest()
  commonAttrsBackgroundColorTest()
  commonAttrsPositionTest()
  commonAttrsBorderWidthTest()
  commonAttrsBorderColorTest()
  commonAttrsBorderRadiusTest()
  commonAttrsBorderStyleTest()
  commonAttrsSweepGradientTest()
  commonAttrsRadialGradientTest()
  commonAttrsTransformTest()
  commonAttrsMaskTest()
  commonAttrsBlendModeTest()
  commonAttrsForegroundBlurStyleTest()
  commonAttrsClipTest()
  commonAttrsLinearGradientTest()
  commonAttrsScaleTest()
  commonAttrsMarginTest()
  commonAttrsConstraintSizeTest()
  commonAttrsContrastTest()
  commonAttrsGrayscaleTest()
  commonAttrsInvertTest()
  commonAttrsOpacityTest()
  commonAttrsSepiaTest()
  customComponentConstraintSizeTest()
  customComponentContrastTest()
  customComponentGrayscaleTest()
  customComponentInvertTest()
  customComponentOpacityTest()
  customComponentSepiaTest()
  customComponentAlignTest()
  customComponentDirectionTest()
  customDialogMaskColorTest()
  customComponentWidthTest()
  customComponentHeightTest()
  customComponentPositionTest()
  customComponentSweepGradientTest()
  customComponentRadialGradientTest()
  customComponentTransformTest()
  customComponentMaskTest()
  customComponentBlendModeTest()
  customComponentClipTest()
  customComponentLinearGradientTest()
  customComponentScaleTest()
  customComponentMarginTest()
  customComponentForegroundBlurStyleTest()
  customComponentBorderColorTest()
  customComponentBorderRadiusTest()
  customComponentBorderStyleTest()
  customComponentBorderWidthTest()
  customComponentBackgroundColorTest()
  customComponentFlexShrinkTest()
  customComponentAlignSelfTest()
  customComponentFlexGrowTest()
  customComponentFlexBasisTest()
  customComponentAccessibilityLevelTest()
  customComponentAccessibilityTextTest()
  customComponentAccessibilityGroupTest()
  customComponentAccessibilityDescriptionTest()
  progressAccessibilityGroupTest()
  progressAccessibilityLevelTest()
  progressAccessibilityTextTest()
  progressAccessibilityDescriptionTest()
  checkboxAccessibilityGroupTest()
  checkboxAccessibilityLevelTest()
  checkboxAccessibilityTextTest()
  checkboxAccessibilityDescriptionTest()
  textPickerAccessibilityGroupTest()
  textPickerAccessibilityLevelTest()
  textPickerAccessibilityTextTest()
  textPickerAccessibilityDescriptionTest()
  buttonAccessibilityGroupTest()
  buttonAccessibilityLevelTest()
  buttonAccessibilityTextTest()
  buttonAccessibilityDescriptionTest()
  sliderAccessibilityGroupTest()
  sliderAccessibilityLevelTest()
  sliderAccessibilityTextTest()
  sliderAccessibilityDescriptionTest()
  timePickerAccessibilityGroupTest()
  timePickerAccessibilityLevelTest()
  timePickerAccessibilityTextTest()
  timePickerAccessibilityDescriptionTest()
  datePickerAccessibilityGroupTest()
  datePickerAccessibilityLevelTest()
  datePickerAccessibilityTextTest()
  datePickerAccessibilityDescriptionTest()
  refreshAccessibilityGroupTest()
  refreshAccessibilityLevelTest()
  refreshAccessibilityTextTest()
  refreshAccessibilityDescriptionTest()
  textAccessibilityGroupTest()
  textAccessibilityLevelTest()
  textAccessibilityTextTest()
  textAccessibilityDescriptionTest()
  toggleAccessibilityTextTest()
  toggleAccessibilityLevelTest()
  toggleAccessibilityGroupTest()
  toggleAccessibilityDescriptionTest()
  listAccessibilityLevelTest()
  listAccessibilityTextTest()
  listAccessibilityGroupTest()
  listAccessibilityDescriptionTest()
  scrollAccessibilityTextTest()
  scrollAccessibilityLevelTest()
  scrollAccessibilityGroupTest()
  scrollAccessibilityDescriptionTest()
  swiperAccessibilityTextTest()
  swiperAccessibilityLevelTest()
  swiperAccessibilityGroupTest()
  swiperAccessibilityDescriptionTest()
  refreshContentTest()
  refreshRefreshingTest()
  refreshPullToRefreshTest()
  refreshPullDownRatioTest()
  refreshOffsetTest()
  progressTypeTest()
  progressValueTest()
  progressTotalTest()
  progressStyleTest()
  progressBackGroundColorTest()
  progressColorTest()
  loadingProgressEnableLoadingTest()
  loadingProgressColorTest()
  sliderValueTest()
  sliderTrackThicknessTest()
  sliderTrackColorTest()
  sliderStyleTest()
  sliderStepTest()
  sliderShowStepsTest()
  sliderSelectedColorTest()
  sliderReverseTest()
  sliderMinTest()
  sliderMaxTest()
  sliderDirectionTest()
  sliderBlockStyleTest()
  sliderBlockColorTest()
  checkboxShapeTest()
  checkboxMarkTest()
  checkboxUnselectedColorTest()
  checkboxSelectedColorTest()
  checkboxSelectTest()
  buttonTypeTest()
  buttonLabelTest()
  buttonBackgroundColorTest()
  buttonFontWeightTest()
  buttonFontColorTest()
  buttonFontSizeTest()
  datePickerWidthTest()
  datePickerLunarTest()
  datePickerEndTest()
  datePickerStartTest()
  datePickerSelectedTest()
  datePickerSelectedTextStyleTest()
  datePickerDisappearTextStyleTest()
  datePickerTextStyleTest()
  textPickerAccessibilityTextTest()
  textPickerAccessibilityLevelTest()
  textPickerAccessibilityGroupTest()
  textPickerAccessibilityDescriptionTest()
  timePickerAccessibilityTextTest()
  timePickerAccessibilityLevelTest()
  timePickerAccessibilityGroupTest()
  timePickerAccessibilityDescriptionTest()
  datePickerAccessibilityTextTest()
  datePickerAccessibilityLevelTest()
  datePickerAccessibilityGroupTest()
  datePickerAccessibilityDescriptionTest()
  scrollPageTest()
  scrollBarWidthTest()
  lazyForEachSetUserDataTest()
  lazyForEachCreateTest()
  lazyForEachDisposeTest()
  lazyForEachSetTotalNodeCountTest()
  lazyForEachGetTotalNodeCountTest()
  lazyForEachRegisterEventReceiverTest()
  lazyForEachUnregisterEventReceiverTest()
  lazyForEachReloadAllItemsTest()
  lazyForEachReloadItemTest()
  lazyForEachRemoveItemTest()
  lazyForEachInsertItemTest()
  lazyForEachMoveItemTest()
  lazyForEachGetAllItemsTest()
  lazyForEachGetUserDataTest()
  lazyForEachGetTypeTest()
  lazyForEachGetRemovedNodeTest()
  lazyForEachSetItemTest()
  lazyForEachSetNodeIdTest()
  listScrollEdgeTest()
}