/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import buttonOnClickTest from './button/ButtonOnClickTest.test'
import buttonBackgroundColorTest from './button/ButtonBackgroundColorTest.test'
import buttonFontColorTest from './button/ButtonFontColorTest.test'
import buttonFontSizeTest from './button/ButtonFontSizeTest.test'
import buttonFontWeightTest from './button/ButtonFontWeightTest.test'
import checkboxOnChangeTest from './checkbox/CheckboxOnChangeTest.test'
import checkboxSelectTest from './checkbox/CheckboxSelectTest.test'
import checkboxSelectedColorTest from './checkbox/CheckboxSelectedColorTest.test'
import checkboxUnselectedColorTest from './checkbox/CheckboxUnselectedColorTest.test'
import checkboxMarkTest from './checkbox/CheckboxMarkTest.test'
import checkboxShapeTest from './checkbox/CheckboxShapeTest.test'
import commonAttrsAlignSelfTest from './commonattrs/CommonAttrsAlignSelfTest.test'
import commonAttrsAlignItemsTest from './commonattrs/CommonAttrsAlignItemsTest.test'
import commonAttrsAlignContentTest from './commonattrs/CommonAttrsAlignContentTest.test'
import commonAttrsFlexGrowTest from './commonattrs/CommonAttrsFlexGrowTest.test'
import commonAttrsFlexBasisTest from './commonattrs/CommonAttrsFlexBasisTest.test'
import commonAttrsFlexShrinkTest from './commonattrs/CommonAttrsFlexShrinkTest.test'
import commonAttrsJustifyContentTest from './commonattrs/CommonAttrsJustifyContentTest.test'
import commonAttrsBackgroundColorTest from './commonattrs/CommonAttrsBackgroundColorTest.test'
import commonAttrsBorderColorTest from './commonattrs/CommonAttrsBorderColorTest.test'
import commonAttrsBorderRadiusTest from './commonattrs/CommonAttrsBorderRadiusTest.test'
import commonAttrsBorderStyleTest from './commonattrs/CommonAttrsBorderStyleTest.test'
import commonAttrsBorderWidthTest from './commonattrs/CommonAttrsBorderWidthTest.test'
import commonAttrsForegroundBlurStyleTest from './commonattrs/CommonAttrsForegroundBlurStyleTest.test'
import commonAttrsHeightTest from './commonattrs/CommonAttrsHeightTest.test'
import commonAttrsPositionTest from './commonattrs/CommonAttrsPositionTest.test'
import commonAttrsWidthTest from './commonattrs/CommonAttrsWidthTest.test'
import commonAttrsAlignTest from './commonattrs/CommonAttrsAlignTest.test'
import commonEventOnClickTest from './commonevent/CommonEventOnClickTest.test'
import commonEventOnFocusTest from './commonevent/CommonEventOnFocusTest.test'
import commonEventOnBlurTest from './commonevent/CommonEventOnBlurTest.test'
import commonEventOnAppearTest from './commonevent/CommonEventOnAppearTest.test'
import commonEventOnAreaChangeTest from './commonevent/CommonEventOnAreaChangeTest.test'
import commonEventOnTouchTest from './commonevent/CommonEventOnTouchTest.test'
import PointEventOnTouchTest from './commonevent/PointEventOnTouchTest.test'
import commonAttrsEnabledTest from './commonattrs/CommonAttrsEnabledTest.test'
import commonAttrsFocusableTest from './commonattrs/CommonAttrsFocusableTest.test'
import commonAttrsHitTestBehaviorTest from './commonattrs/CommonAttrsHitTestBehaviorTest.test'
import commonAttrsIdTest from './commonattrs/CommonAttrsIdTest.test'
import commonAttrsContrastTest from './commonattrs/CommonAttrsContrastTest.test'
import commonAttrsGrayscaleTest from './commonattrs/CommonAttrsGrayscaleTest.test'
import commonAttrsInvertTest from './commonattrs/CommonAttrsInvertTest.test'
import commonAttrsOpacityTest from './commonattrs/CommonAttrsOpacityTest.test'
import commonAttrsSepiaTest from './commonattrs/CommonAttrsSepiaTest.test'
import customComponentOnMeasureTest from './customcomponent/CustomComponentOnMeasureTest.test'
import customComponentOnLayoutTest from './customcomponent/CustomComponentOnLayoutTest.test'
import customComponentOnDrawTest from './customcomponent/CustomComponentOnDrawTest.test'
import imageHitTestBehaviorTest from './image/ImageHitTestBehaviorTest.test'
import imageIdTest from './image/ImageIdTest.test'
import imageOnCompleteTest from './image/ImageOnCompleteTest.test'
import imageOnErrorTest from './image/ImageOnErrorTest.test'
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
import imageShadowTest from './image/ImageShadowTest.test'
import imageSrcTest from './image/ImageSrcTest.test'
import imageSweepGradientTest from './image/ImageSweepGradientTest.test'
import imageTransformTest from './image/ImageTransformTest.test'
import imageTranslateTest from './image/ImageTranslateTest.test'
import listHitTestBehaviorTest from './list/ListHitTestBehaviorTest.test'
import listItemHitTestBehaviorTest from './listitem/ListItemHitTestBehaviorTest.test'
import toggleOnChangeTest from './toggle/ToggleOnChangeTest.test'
import toggleEnabledTest from './toggle/ToggleEnabledTest.test'
import scrollNestedScrollTest from './scroll/ScrollNestedScrollTest.test'
import scrollHitTestBehaviorTest from './scroll/ScrollHitTestBehaviorTest.test'
import scrollOnAppearTest from './scroll/ScrollOnAppearTest.test'
import scrollOnScrollEdgeTest from './scroll/ScrollOnScrollEdgeTest.test'
import scrollOnScrollFrameBeginTest from './scroll/ScrollOnScrollFrameBeginTest.test'
import scrollOnScrollStartTest from './scroll/ScrollOnScrollStartTest.test'
import scrollOnScrollStopTest from './scroll/ScrollOnScrollStopTest.test'
import scrollOnScrollTest from './scroll/ScrollOnScrollTest.test'
import scrollScrollEdgeTest from './scroll/ScrollScrollEdgeTest.test'
import stackHitTestBehaviorTest from './stack/StackHitTestBehaviorTest.test'
import stackOnAreaChangeTest from './stack/StackOnAreaChangeTest.test'
import stackOnTouchTest from './stack/StackOnTouchTest.test'
import textEnabledTest from './text/TextEnabledTest.test'
import commonAttrsDirectionTest from './commonattrs/CommonAttrsDirectionTest.test'
import commonAttrsTransformTest from './commonattrs/CommonAttrsTransformTest.test'
import commonAttrsMaskTest from './commonattrs/CommonAttrsMaskTest.test'
import commonAttrsBlendModeTest from './commonattrs/CommonAttrsBlendModeTest.test'
import stackAlignTest from './stack/StackAlignTest.test'
import stackBackgroundBlurStyleTest from './stack/StackBackgroundBlurStyleTest.test'
import stackBackgroundColorTest from './stack/StackBackgroundColorTest.test'
import stackBackgroundImageTest from './stack/StackBackgroundImageTest.test'
import stackBackgroundImagePositionTest from './stack/StackBackgroundImagePositionTest.test'
import stackBackgroundImageSizeTest from './stack/StackBackgroundImageSizeTest.test'
import stackBorderColorTest from './stack/StackBorderColorTest.test'
import stackBorderRadiusTest from './stack/StackBorderRadiusTest.test'
import stackBorderStyleTest from './stack/StackBorderStyleTest.test'
import stackBorderWidthTest from './stack/StackBorderWidthTest.test'
import stackBrightnessTest from './stack/StackBrightnessTest.test'
import stackClipTest from './stack/StackClipTest.test'
import stackHeightTest from './stack/StackHeightTest.test'
import stackIdTest from './stack/StackIdTest.test'
import stackLinearGradientTest from './stack/StackLinearGradientTest.test'
import stackMarginTest from './stack/StackMarginTest.test'
import stackOpacityTest from './stack/StackOpacityTest.test'
import stackPositionTest from './stack/StackPositionTest.test'
import stackRotateTest from './stack/StackRotateTest.test'
import stackSaturateTest from './stack/StackSaturateTest.test'
import stackScaleTest from './stack/StackScaleTest.test'
import stackShadowTest from './stack/StackShadowTest.test'
import stackTransformTest from './stack/StackTransformTest.test'
import stackTransitionTest from './stack/StackTransitionTest.test'
import stackTranslateTest from './stack/StackTranslateTest.test'
import stackWidthTest from './stack/StackWidthTest.test'
import toggleBackgroundColorTest from './toggle/ToggleBackgroundColorTest.test'
import toggleClipTest from './toggle/ToggleClipTest.test'
import toggleFocusableTest from './toggle/ToggleFocusableTest.test'
import toggleHeightTest from './toggle/ToggleHeightTest.test'
import toggleMarginTest from './toggle/ToggleMarginTest.test'
import togglePositionTest from './toggle/TogglePositionTest.test'
import toggleSelectedColorTest from './toggle/ToggleSelectedColorTest.test'
import toggleSwitchPointColorTest from './toggle/ToggleSwitchPointColorTest.test'
import toggleWidthTest from './toggle/ToggleWidthTest.test'
import toggleSwitchTest from './toggle/ToggleSwitchTest.test'
import swiperAutoPlayTest from './swiper/SwiperAutoPlayTest.test'
import swiperBackgroundColorTest from './swiper/SwiperBackgroundColorTest.test'
import swiperBackgroundImageTest from './swiper/SwiperBackgroundImageTest.test'
import swiperClipTest from './swiper/SwiperClipTest.test'
import swiperCurveTest from './swiper/SwiperCurveTest.test'
import swiperDisableSwipeTest from './swiper/SwiperDisableSwipeTest.test'
import swiperDisplayArrowTest from './swiper/SwiperDisplayArrowTest.test'
import swiperDisplayCountTest from './swiper/SwiperDisplayCountTest.test'
import swiperDurationTest from './swiper/SwiperDurationTest.test'
import swiperHeightTest from './swiper/SwiperHeightTest.test'
import swiperIndexTest from './swiper/SwiperIndexTest.test'
import swiperIndicatorTest from './swiper/SwiperIndicatorTest.test'
import swiperIntervalTest from './swiper/SwiperIntervalTest.test'
import swiperItemSpaceTest from './swiper/SwiperItemSpaceTest.test'
import swiperLoopTest from './swiper/SwiperLoopTest.test'
import swiperPositionTest from './swiper/SwiperPositionTest.test'
import swiperVerticalTest from './swiper/SwiperVerticalTest.test'
import swiperWidthTest from './swiper/SwiperWidthTest.test'
import swiperCachedCountTest from './swiper/SwiperCachedCountTest.test'
import textWidthTest from './text/TextWidthTest.test'
import textHeightTest from './text/TextHeightTest.test'
import textPositionTest from './text/TextPositionTest.test'
import TextStyleGraphicTest from './text/TextStyleGraphicTest.test'
import scrollWidthTest from './scroll/ScrollWidthTest.test'
import scrollHeightTest from './scroll/ScrollHeightTest.test'
import scrollPositionTest from './scroll/ScrollPositionTest.test'
import imageWidthTest from './image/ImageWidthTest.test'
import imageHeightTest from './image/ImageHeightTest.test'
import imagePositionTest from './image/ImagePositionTest.test'
import listHeightTest from './list/ListHeightTest.test'
import listWidthTest from './list/ListWidthTest.test'
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
import listShadowTest from './list/ListShadowTest.test'
import ListNodeAdapterTest from './list/ListNodeAdapterTest.test'
import ListNodeAdapterEventTest from './list/ListNodeAdapterEventTest.test'
import listItemLinearGradientTest from './listitem/ListItemLinearGradientTest.test'
import listItemShadowTest from './listitem/ListItemShadowTest.test'
import listItemBlurTest from './listitem/ListItemBlurTest.test'
import listItemBrightnessTest from './listitem/ListItemBrightnessTest.test'
import listItemScaleTest from './listitem/ListItemScaleTest.test'
import listItemTranslateTest from './listitem/ListItemTranslateTest.test'
import listItemRotateTest from './listitem/ListItemRotateTest.test'
import listItemSaturateTest from './listitem/ListItemSaturateTest.test'
import listItemClipTest from './listitem/ListItemClipTest.test'
import listItemOpacityTest from './listitem/ListItemOpacityTest.test'
import listItemBorderRadiusTest from './listitem/ListItemBorderRadiusTest.test'
import listItemBorderColorTest from './listitem/ListItemBorderColorTest.test'
import listItemBorderWidthTest from './listitem/ListItemBorderWidthTest.test'
import listItemBackgroundColorTest from './listitem/ListItemBackgroundColorTest.test'
import listItemWidthTest from './listitem/ListItemWidthTest.test'
import listItemHeightTest from './listitem/ListItemHeightTest.test'
import listEnableScrollInteractionTest from './list/ListEnableScrollInteractionTest.test'
import ListSwipeChildMinSizeTest from  './list/ListSwipeChildMinSizeTest.test.ets'
import listCachedCountTest from './list/ListCachedCountTest.test'
import listFrictionTest from './list/ListFrictionTest.test'
import listStickyTest from './list/ListStickyTest.test'
import listListDirectionTest from './list/ListListDirectionTest.test'
import listLinearGradientTest from './list/ListLinearGradientTest.test'
import listScrollBarTest from './list/ListScrollBarTest.test'
import listEdgeEffectTest from './list/ListEdgeEffectTest.test'
import ListSwipeActionItemTest from './list/ListSwipeActionItemTest.test'
import commonAttrsClipTest from './commonattrs/CommonAttrsClipTest.test'
import commonAttrsLinearGradientTest from './commonattrs/CommonAttrsLinearGradientTest.test'
import commonAttrsShadowTest from './commonattrs/CommonAttrsShadowTest.test'
import commonAttrsScaleTest from './commonattrs/CommonAttrsScaleTest.test'
import commonAttrsMarginTest from './commonattrs/CommonAttrsMarginTest.test'
import commonAttrsConstraintSizeTest from './commonattrs/CommonAttrsConstraintSizeTest.test'
import textAlignTest from './text/TextAlignTest.test'
import textBackgroundColorTest from './text/TextBackgroundColorTest.test'
import textBackgroundImageTest from './text/TextBackgroundImageTest.test'
import textBaselineOffsetTest from './text/TextBaselineOffsetTest.test'
import textBorderColorTest from './text/TextBorderColorTest.test'
import textBorderRadiusTest from './text/TextBorderRadiusTest.test'
import textBorderWidthTest from './text/TextBorderWidthTest.test'
import textClipTest from './text/TextClipTest.test'
import textCopyOptionTest from './text/TextCopyOptionTest.test'
import textDecorationTest from './text/TextDecorationTest.test'
import textFontColorTest from './text/TextFontColorTest.test'
import textFontFamilyTest from './text/TextFontFamilyTest.test'
import textFontSizeTest from './text/TextFontSizeTest.test'
import textFontStyleTest from './text/TextFontStyleTest.test'
import textFontTest from './text/TextFontTest.test'
import textFontWeightTest from './text/TextFontWeightTest.test'
import textHeightAdaptivePolicyTest from './text/TextHeightAdaptivePolicyTest.test'
import textLetterSpacingTest from './text/TextLetterSpacingTest.test'
import textLinearGradientTest from './text/TextLinearGradientTest.test'
import textLineHeightTest from './text/TextLineHeightTest.test'
import textMaskTest from './text/TextMaskTest.test'
import textMaxLinesTest from './text/TextMaxLinesTest.test'
import textMinFontSizeTest from './text/TextMinFontSizeTest.test'
import textOffsetTest from './text/TextOffsetTest.test'
import textMaxFontSizeTest from './text/TextMaxFontSizeTest.test'
import textOpacityTest from './text/TextOpacityTest.test'
import textRadialGradientTest from './text/TextRadialGradientTest.test'
import textShadowTest from './text/TextShadowTest.test'
import textTextAlignTest from './text/TextTextAlignTest.test'
import textScaleTest from './text/TextScaleTest.test'
import textOverlayTest from './text/TextOverlayTest.test'
import textPaddingTest from './text/TextPaddingTest.test'
import textSweepGradientTest from './text/TextSweepGradientTest.test'
import textTextCaseTest from './text/TextTextCaseTest.test'
import textTextIndentTest from './text/TextTextIndentTest.test'
import textTextOverflowTest from './text/TextTextOverflowTest.test'
import textTextShadowTest from './text/TextTextShadowTest.test'
import textTransformTest from './text/TextTransformTest.test'
import textVisibilityTest from './text/TextVisibilityTest.test'
import textLineBreakStrategyTest from './text/TextLineBreakStrategyTest.test'
import textAlignRulesTest from './text/TextAlignRulesTest.test'
import commonAttrsRadialGradientTest from './commonattrs/CommonAttrsRadialGradientTest.test'
import commonAttrsSweepGradientTest from './commonattrs/CommonAttrsSweepGradientTest.test'
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
import scrollShadowTest from './scroll/ScrollShadowTest.test'
import scrollEdgeEffectTest from './scroll/ScrollEdgeEffectTest.test'
import scrollFrictionTest from './scroll/ScrollFrictionTest'
import scrollScrollSnapTest from './scroll/ScrollScrollSnapTest.test'
import scrollCurrentOffsetTest from './scroll/ScrollCurrentOffsetTest.test'
import scrollSaturateTest from './scroll/ScrollSaturateTest'
import scrollScrollToTest from './scroll/ScrollScrollToTest.test'
import scrollOverlayTest from './scroll/ScrollOverlayTest.test'
import scrollLinearGradientTest from './scroll/ScrollLinearGradientTest'
import scrollPageEnableTest from './scroll/ScrollPageEnableTest'
import calendarPickerOnChangeTest from './calendarpicker/CalendarPickerOnChangeTest.test'
import textPickerOnChangeTest from './textpicker/TextPickerOnChangeTest.test'
import calendarPickerEdgeAlignTest from './calendarpicker/CalendarPickerEdgeAlignTest.test'
import calendarPickerTextStyleTest from './calendarpicker/CalendarPickerTextStyleTest.test'
import textPickerDisappearTextStyleTest from './textpicker/TextPickerDisappearTextStyleTest.test'
import textPickerTextStyleTest from './textpicker/TextPickerTextStyleTest.test'
import textPickerSelectedTextStyleTest from './textpicker/TextPickerSelectedTextStyleTest.test'
import textPickerSelectedIndexTest from './textpicker/TextPickerSelectedIndexTest.test'
import textPickerSelectedTest from './textpicker/TextPickerSelectedTest.test'
import textPickerCanLoopTest from './textpicker/TextPickerCanLoopTest.test'
import textPickerDefaultPickerItemHeightTest from './textpicker/TextPickerDefaultPickerItemHeightTest.test'
import textPickerValueTest from './textpicker/TextPickerValueTest.test'
import customDialogOpenTest from './customdialog/CustomDialogOpenTest.test'
import customDialogCloseTest from './customdialog/CustomDialogCloseTest.test'
import customDialogAlignmentTest from './customdialog/CustomDialogAlignmentTest.test'
import customDialogCustomStyleTest from './customdialog/CustomDialogCustomStyleTest.test'
import datePickerLunarTest from './datepicker/DatePickerLunarTest.test'
import datePickerOnDateChangeTest from './datepicker/DatePickerOnDateChangeTest.test'
import datePickerStartTest from './datepicker/DatePickerStartTest.test'
import datePickerEndTest from './datepicker/DatePickerEndTest.test'
import datePickerSelectedTest from './datepicker/DatePickerSelectedTest.test'
import datePickerSelectedTextStyleTest from './datepicker/DatePickerSelectedTextStyleTest.test'
import datePickerDisappearTextStyleTest from './datepicker/DatePickerDisappearTextStyleTest.test'
import datePickerTextStyleTest from './datepicker/DatePickerTextStyleTest.test'
import timePickerUseMilitaryTimeTest from './timepicker/TimePickerUseMilitaryTimeTest.test'
import timePickerOnChangeTest from './timepicker/TimePickerOnChangeTest.test'
import timePickerHeightTest from './timepicker/TimePickerHeightTest.test'
import timePickerSelectedTest from './timepicker/TimePickerSelectedTest.test'
import timePickerTextStyleTest from './timepicker/TimePickerTextStyleTest.test'
import timePickerDisappearTextStyleTest from './timepicker/TimePickerDisappearTextStyleTest.test'
import timePickerSelectedTextStyleTest from './timepicker/TimePickerSelectedTextStyleTest.test'
import xComponentSourceIdTest from './xcomponent/XComponentSourceIdTest.test'
import xComponentTypeTest from './xcomponent/XComponentTypeTest.test'
import customDialogMaskColorTest from './customdialog/CustomDialogMaskColorTest.test'
import textPickerRangeTest from './textpicker/TextPickerRangeTest.test'
import textInputAccessibilityDescriptionTest from './accessibility/TextInputAccessibilityDescriptionTest.test'
import textInputAccessibilityGroupTest from './accessibility/TextInputAccessibilityGroupTest.test'
import textInputAccessibilityLevelTest from './accessibility/TextInputAccessibilityLevelTest.test'
import textInputAccessibilityTextTest from './accessibility/TextInputAccessibilityTextTest.test'
import textAreaAccessibilityDescriptionTest from './accessibility/TextAreaAccessibilityDescriptionTest.test'
import textAreaAccessibilityGroupTest from './accessibility/TextAreaAccessibilityGroupTest.test'
import textAreaAccessibilityLevelTest from './accessibility/TextAreaAccessibilityLevelTest.test'
import textAreaAccessibilityTextTest from './accessibility/TextAreaAccessibilityTextTest.test'
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
import customComponentHeightTest from './customcomponent/CustomComponentHeightTest.test'
import customComponentPositionTest from './customcomponent/CustomComponentPositionTest.test'
import customComponentWidthTest from './customcomponent/CustomComponentWidthTest.test'
import customComponentAlignTest from './customcomponent/CustomComponentAlignTest.test'
import customComponentEnabledTest from './customcomponent/CustomComponentEnabledTest.test'
import customComponentFocusableTest from './customcomponent/CustomComponentFocusableTest.test'
import customComponentHitTestBehaviorTest from './customcomponent/CustomComponentHitTestBehaviorTest.test'
import customComponentIdTest from './customcomponent/CustomComponentIdTest.test'
import customComponentContrastTest from './customcomponent/CustomComponentContrastTest.test'
import customComponentGrayscaleTest from './customcomponent/CustomComponentGrayscaleTest.test'
import customComponentInvertTest from './customcomponent/CustomComponentInvertTest.test'
import customComponentOpacityTest from './customcomponent/CustomComponentOpacityTest.test'
import customComponentSepiaTest from './customcomponent/CustomComponentSepiaTest.test'
import customComponentDirectionTest from './customcomponent/CustomComponentDirectionTest.test'
import customComponentTransformTest from './customcomponent/CustomComponentTransformTest.test'
import customComponentMaskTest from './customcomponent/CustomComponentMaskTest.test'
import customComponentBlendModeTest from './customcomponent/CustomComponentBlendModeTest.test'
import customComponentClipTest from './customcomponent/CustomComponentClipTest.test'
import customComponentLinearGradientTest from './customcomponent/CustomComponentLinearGradientTest.test'
import customComponentShadowTest from './customcomponent/CustomComponentShadowTest.test'
import customComponentScaleTest from './customcomponent/CustomComponentScaleTest.test'
import customComponentMarginTest from './customcomponent/CustomComponentMarginTest.test'
import customComponentConstraintSizeTest from './customcomponent/CustomComponentConstraintSizeTest.test'
import customComponentRadialGradientTest from './customcomponent/CustomComponentRadialGradientTest.test'
import customComponentSweepGradientTest from './customcomponent/CustomComponentSweepGradientTest.test'
import customComponentAccessibilityDescriptionTest from './customcomponent/CustomComponentAccessibilityDescriptionTest.test'
import customComponentAccessibilityLevelTest from './customcomponent/CustomComponentAccessibilityLevelTest.test'
import customComponentAccessibilityTextTest from './customcomponent/CustomComponentAccessibilityTextTest.test'
import customComponentAccessibilityGroupTest from './customcomponent/CustomComponentAccessibilityGroupTest.test'
import customComponentOnClickTest from './customcomponent/CustomComponentOnClickTest.test'
import customComponentOnFocusTest from './customcomponent/CustomComponentOnFocusTest.test'
import customComponentOnBlurTest from './customcomponent/CustomComponentOnBlurTest.test'
import customComponentOnAppearTest from './customcomponent/CustomComponentOnAppearTest.test'
import customComponentOnAreaChangeTest from './customcomponent/CustomComponentOnAreaChangeTest.test'
import customComponentOnTouchTest from './customcomponent/CustomComponentOnTouchTest.test'
import textInputBackgroundColorTest from './textinput/TextInputBackgroundColorTest.test'
import textInputBackgroundImageTest from './textinput/TextInputBackgroundImageTest.test'
import textInputCaretColorTest from './textinput/TextInputCaretColorTest.test'
import textInputClipTest from './textinput/TextInputClipTest.test'
import textInputFontColorTest from './textinput/TextInputFontColorTest.test'
import textInputFontSizeTest from './textinput/TextInputFontSizeTest.test'
import textInputFontStyleTest from './textinput/TextInputFontStyleTest.test'
import textInputFontWeightTest from './textinput/TextInputFontWeightTest.test'
import textInputPaddingTest from './textinput/TextInputPaddingTest.test'
import textInputShowUnderLineTest from './textinput/TextInputShowUnderLineTest.test'
import textInputTextAlignTest from './textinput/TextInputTextAlignTest.test'
import imageSpanWidthTest from './imagespan/ImageSpanWidthTest.test'
import imageSpanHeightTest from './imagespan/ImageSpanHeightTest.test'
import imageSpanObjectFitTest from './imagespan/ImageSpanObjectFitTest.test'
import imageSpanVerticalAlignTest from './imagespan/ImageSpanVerticalAlignTest.test'
import imageSpanPaddingTest from './imagespan/ImageSpanPaddingTest.test'
import columnWidthTest from './column/ColumnWidthTest.test'
import columnHeightTest from './column/ColumnHeightTest.test'
import columnPaddingTest from './column/ColumnPaddingTest.test'
import columnForegroundBlurStyleTest from './column/ColumnForegroundBlurStyleTest.test'
import rowHeightTest from './row/RowHeightTest.test'
import sliderWidthTest from './slider/SliderWidthTest.test'
import sliderHeightTest from './slider/SliderHeightTest.test'
import sliderEnabledTest from './slider/SliderEnabledTest.test'
import calendarPickerWidthTest from './calendarpicker/CalendarPickerWidthTest.test'
import datePickerWidthTest from './datepicker/DatePickerWidthTest.test'
import checkboxWidthTest from './checkbox/CheckboxWidthTest.test'
import checkboxHeightTest from './checkbox/CheckboxHeightTest.test'
import checkboxEnabledTest from './checkbox/CheckboxEnabledTest.test'
import textPickerWidthTest from './textpicker/TextPickerWidthTest.test'
import textPickerHeightTest from './textpicker/TextPickerHeightTest.test'
import flexWidthTest from './flex/FlexWidthTest.test'
import flexHeightTest from './flex/FlexHeightTest.test'
import xComponentWidthTest from './xcomponent/XComponentWidthTest.test'
import xComponentHeightTest from './xcomponent/XComponentHeightTest.test'
import textAreaWidthTest from './textarea/TextAreaWidthTest.test'
import textAreaHeightTest from './textarea/TextAreaHeightTest.test'
import textAreaPositionTest from './textarea/TextAreaPositionTest.test'
import textAreaEnabledTest from './textarea/TextAreaEnabledTest.test'
import textInputWidthTest from './textinput/TextInputWidthTest.test'
import textInputHeightTest from './textinput/TextInputHeightTest.test'
import textInputPositionTest from './textinput/TextInputPositionTest.test'
import textInputShowPasswordIconTest from './textinput/TextInputShowPasswordIconTest.test'
import textInputCaretStyleTest from './textinput/TextInputCaretStyleTest.test'
import textInputSelectedBackgroundColorTest from './textinput/TextInputSelectedBackgroundColorTest.test'
import textInputEnabledTest from './textinput/TextInputEnabledTest.test'
import textInputTypeTest from './textinput/TextInputTypeTest.test'
import textInputOnChangeTest from './textinput/TextInputOnChangeTest.test'
import textInputEnterKeyTypeTest from './textinput/TextInputEnterKeyTypeTest.test'
import textInputEnableKeyboardOnFocusTest from './textinput/TextInputEnableKeyboardOnFocusTest.test'
import calendarPickerEnabledTest from './calendarpicker/CalendarPickerEnabledTest.test'
import datePickerEnabledTest from './datepicker/DatePickerEnabledTest.test'
import spanDecorationTest from './span/SpanDecorationTest.test'
import spanTextCaseTest from './span/SpanTextCaseTest.test'
import spanLetterSpacingTest from './span/SpanLetterSpacingTest.test'
import spanLineHeightTest from './span/SpanLineHeightTest.test'
import spanFontColorTest from './span/SpanFontColorTest.test'
import spanFontSizeTest from './span/SpanFontSizeTest.test'
import spanFontStyleTest from './span/SpanFontStyleTest.test'
import spanFontWeightTest from './span/SpanFontWeightTest.test'
import loadingProgressColorTest from './loadingprogress/LoadingProgressColorTest'
import loadingProgressEnableLoadingTest from './loadingprogress/LoadingProgressEnableLoadingTest'
import progressColorTest from './progress/ProgressColorTest'
import progressBackGroundColorTest from './progress/ProgressBackgroundColorTest'
import textAreaTextAlignTest from './textarea/TextAreaTextAlignTest'
import textAreaBorderRadiusTest from './textarea/TextAreaBorderRadiusTest'
import textAreaBackgroundColorTest from './textarea/TextAreaBackgroundColorTest'
import textAreaCaretColorTest from './textarea/TextAreaCaretColorTest'
import textAreaFontColorTest from './textarea/TextAreaFontColorTest'
import textAreaPlaceholderColorTest from './textarea/TextAreaPlaceholderColorTest'
import textAreaStopEditingTest from './textarea/TextAreaStopEditingTest'
import textAreaFontFamilyTest from './textarea/TextAreaFontFamilyTest'
import textAreaFontSizeTest from './textarea/TextAreaFontSizeTest'
import textAreaFontWeightTest from './textarea/TextAreaFontWeightTest'
import textAreaFontStyleTest from './textarea/TextAreaFontStyleTest'
import textAreaLineHeightTest from './textarea/TextAreaLineHeightTest'
import textAreaMaxLengthTest from './textarea/TextAreaMaxLengthTest'
import textAreaPaddingTest from './textarea/TextAreaPaddingTest'
import textAreaPlaceholderFontTest from './textarea/TextAreaPlaceholderFontTest'
import textInputFontFamilyTest from './textinput/TextInputFontFamilyTest'
import textInputPlaceholderFontTest from './textinput/TextInputPlaceholderFontTest'
import textInputMaxLengthTest from './textinput/TextInputMaxLengthTest'
import textInputPlaceholderColorTest from './textinput/TextInputPlaceholderColorTest'
import textInputResponseRegionTest from './textinput/TextInputResponseRegionTest'
import textInputClearButtonModeTest from './textinput/TextInputClearButtonModeTest'
import textAreaDefaultFocusTest from './textarea/TextAreaDefaultFocusTest'
import textAreaResponseRegionTest from './textarea/TextAreaResponseRegionTest'
import refreshOnRefreshingTest from './refresh/RefreshOnRefreshingTest'
import refreshOnStateChangeTest from './refresh/RefreshOnStateChangeTest'
import textAreaOnFocusTest from './textarea/TextAreaOnFocusTest'
import textAreaOnBlurTest from './textarea/TextAreaOnBlurTest'
import textAreaKeyTest from './textarea/TextAreaKeyTest'
import textInputKeyTest from './textinput/TextInputKeyTest'
import textAreaOnChangeTest from './textarea/TextAreaOnChangeTest'
import progressStyleTest from './progress/ProgressStyleTest'
import sliderOnChangeTest from './slider/SliderOnChangeTest.test'
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
import sliderValueTest from './slider/SliderValueTest.test'
import textInputStopEditingTest from './textinput/TextInputStopEditingTest.test'
import textInputLineHeightTest from './textinput/TextInputLineHeightTest.test'
import textInputOnBlurTest from './textinput/TextInputOnBlurTest.test'
import textInputOnFocusTest from './textinput/TextInputOnFocusTest.test'
import textInputOnSubmitTest from './textinput/TextInputOnSubmitTest.test'
import textInputOnCutTest from './textinput/TextInputOnCutTest.test'
import textInputOnPasteTest from './textinput/TextInputOnPasteTest.test'
import textInputDefaultFocusTest from './textinput/TextInputDefaultFocusTest'
import TestArkUIAddApi from './arkApi/arkApi.test'
import testArkUI from './arkApi/arkUIApiTest.test'
import testAnimationTest from './animation/animationTest.test'
import testWaterFlower from './waterFlower/waterFlowerTest.test'
import accessibilityStateTest from './accessibilityState/accessibilityStateTest.test'
import relativecontaineAlignmentRuleOptionTest from './relativecontaine/RelativeContaineAlignmentRuleOptionTest.test'
import relativecontaineBarrierOptionTest from './relativecontaine/RelativeContaineBarrierOptionTest.test'
import testGesture from './gesture/GestureTest.test'
import gestureNestScrollTest from './gestureScroll/GestureNestScollTest.test'

import customComponentEventTest from './customcomponent/CustomComponentEventTest.test'
import commonAttrsAnimateTest from './commonattrs/CommonAttrsAnimateTest.test'
import drawableDescriptorCreateTest from './drawabledescriptor/DrawableDescriptorCreateTest.test'
import nodeContentTest from './nodecontent/NodeContentTest.test'
import nativeXComponentTest from './nativexcomponent/NativeXComponentTest.test'
import mouseEventTest from './mouseevent/MouseEventTest.test'
import pointerEventTest from './pointerevent/PointerEventTest.test'
import nativeTest from './native/nativeTest.test'
import DialogDismissEventTest from './Dialog/DialogDismissEvent.test'
import SystemColorFontChangeTest from "./system/SystemColorFontChange.test"
import DragGetDragEventTest from "./drag/DragGetDragEvent.test"
import DragEventGetDataTypesTest from "./drag/DragEventGetDataTypes.test"
import DragEventDisableDefaultDropAnimationTest from "./drag/DragEventDisableDefaultDropAnimation.test"
import DragGetPreDragStatusTest from "./drag/DragGetPreDragStatus.test"
import DragEventSetSuggestedDropOperationTest from "./drag/DragEventSetSuggestedDropOperation.test"
import DragEventSetDragResultTest from "./drag/DragEventSetDragResult.test"
import DragEventGetDataTypesCountTest from "./drag/DragEventGetDataTypesCount.test"
import DragEventGetDragResultTest from "./drag/DragEventGetDragResult.test"
import DragEventGetDropOperationTest from "./drag/DragEventGetDropOperation.test"
import DragSetGetUdmfDataTest from "./drag/DragSetGetUdmfData.test"
import DragEventGetXYTest from "./drag/DragEventGetXY.test"
import DragEventGetWidthHeightTest from "./drag/DragEventGetWidthHeight.test"
import DragEventGetModifierKeyStatesTest from "./drag/DragEventGetModifierKeyStates.test"
import DragSetDragEventStrictReportTest from "./drag/DragSetDragEventStrictReport.test"
import DragAllowDropDataTypesTest from "./drag/DragAllowDropDataTypes.test"
import DragSetNodeDragPreviewTest from "./drag/DragSetNodeDragPreview.test"
import DragDragPreviewOptionTest from "./drag/DragDragPreviewOption.test"
import DragDragActionTest from "./drag/DragDragAction.test"
import DragActionCreateDragActionTest from "./drag/DragActionCreateDragAction.test"
import DragActionSetPointerIdTest from "./drag/DragActionSetPointerId.test"
import DragActionSetDragPreviewOptionTest from "./drag/DragActionSetDragPreviewOption.test"
import DragActionSetTouchPointXYTest from "./drag/DragActionSetTouchPointXY.test"
import DragActionRegisterStatusListenerTest from "./drag/DragActionRegisterStatusListener.test"

export default function testsuite() {
  datePickerAccessibilityDescriptionTest()
  datePickerAccessibilityGroupTest()
  datePickerAccessibilityLevelTest()
  datePickerAccessibilityTextTest()
  timePickerAccessibilityDescriptionTest()
  timePickerAccessibilityGroupTest()
  timePickerAccessibilityLevelTest()
  timePickerAccessibilityTextTest()
  textPickerAccessibilityDescriptionTest()
  textPickerAccessibilityGroupTest()
  textPickerAccessibilityLevelTest()
  textPickerAccessibilityTextTest()
  datePickerTextStyleTest()
  datePickerDisappearTextStyleTest()
  datePickerSelectedTextStyleTest()
  datePickerSelectedTest()
  datePickerStartTest()
  datePickerEndTest()
  datePickerLunarTest()
  datePickerWidthTest()
  timePickerTextStyleTest()
  timePickerDisappearTextStyleTest()
  timePickerSelectedTextStyleTest()
  timePickerSelectedTest()
  timePickerHeightTest()
  timePickerUseMilitaryTimeTest()
  textPickerRangeTest()
  textPickerValueTest()
  textPickerDefaultPickerItemHeightTest()
  textPickerCanLoopTest()
  textPickerSelectedTest()
  textPickerSelectedIndexTest()
  textPickerSelectedTextStyleTest()
  textPickerTextStyleTest()
  textPickerDisappearTextStyleTest()
  textPickerWidthTest()
  textPickerHeightTest()
  buttonFontSizeTest()
  buttonFontColorTest()
  buttonFontWeightTest()
  buttonBackgroundColorTest()
  checkboxSelectTest()
  checkboxSelectedColorTest()
  checkboxUnselectedColorTest()
  checkboxMarkTest()
  checkboxShapeTest()
  sliderBlockColorTest()
  sliderBlockStyleTest()
  sliderDirectionTest()
  sliderMaxTest()
  sliderMinTest()
  sliderReverseTest()
  sliderSelectedColorTest()
  sliderShowStepsTest()
  sliderStepTest()
  sliderStyleTest()
  sliderTrackColorTest()
  sliderValueTest()
  textInputStopEditingTest()
  textInputLineHeightTest()
  loadingProgressColorTest()
  loadingProgressEnableLoadingTest()
  progressColorTest()
  progressBackGroundColorTest()
  textAreaTextAlignTest()
  textAreaBorderRadiusTest()
  textAreaBackgroundColorTest()
  textAreaCaretColorTest()
  textAreaFontColorTest()
  textAreaPlaceholderColorTest()
  textAreaPlaceholderFontTest()
  textAreaStopEditingTest()
  textAreaFontFamilyTest()
  textAreaFontSizeTest()
  textAreaFontWeightTest()
  textAreaFontStyleTest()
  textAreaLineHeightTest()
  textAreaMaxLengthTest()
  textAreaPaddingTest()
  textInputFontFamilyTest()
  textInputPlaceholderFontTest()
  textInputMaxLengthTest()
  textInputPlaceholderColorTest()
  progressStyleTest()
  textInputBackgroundColorTest()
  textInputBackgroundImageTest()
  textInputCaretColorTest()
  textInputClipTest()
  textInputDefaultFocusTest()
  textInputFontColorTest()
  textInputFontSizeTest()
  textInputFontStyleTest()
  textInputFontWeightTest()
  textInputPaddingTest()
  textInputShowUnderLineTest()
  textInputTextAlignTest()
  textInputAccessibilityDescriptionTest()
  textInputAccessibilityGroupTest()
  textInputAccessibilityLevelTest()
  textInputAccessibilityTextTest()
  textAreaAccessibilityDescriptionTest()
  textAreaAccessibilityGroupTest()
  textAreaAccessibilityLevelTest()
  textAreaAccessibilityTextTest()
  swiperAccessibilityDescriptionTest()
  swiperAccessibilityGroupTest()
  swiperAccessibilityLevelTest()
  swiperAccessibilityTextTest()
  scrollAccessibilityDescriptionTest()
  scrollAccessibilityGroupTest()
  scrollAccessibilityLevelTest()
  scrollAccessibilityTextTest()
  listAccessibilityDescriptionTest()
  listAccessibilityGroupTest()
  listAccessibilityLevelTest()
  listAccessibilityTextTest()
  toggleAccessibilityDescriptionTest()
  toggleAccessibilityGroupTest()
  toggleAccessibilityLevelTest()
  toggleAccessibilityTextTest()
  textAccessibilityDescriptionTest()
  textAccessibilityGroupTest()
  textAccessibilityLevelTest()
  textAccessibilityTextTest()
  refreshAccessibilityDescriptionTest()
  refreshAccessibilityGroupTest()
  refreshAccessibilityLevelTest()
  refreshAccessibilityTextTest()
  sliderAccessibilityDescriptionTest()
  sliderAccessibilityGroupTest()
  sliderAccessibilityLevelTest()
  sliderAccessibilityTextTest()
  buttonAccessibilityDescriptionTest()
  buttonAccessibilityGroupTest()
  buttonAccessibilityLevelTest()
  buttonAccessibilityTextTest()
  checkboxAccessibilityDescriptionTest()
  checkboxAccessibilityGroupTest()
  checkboxAccessibilityLevelTest()
  checkboxAccessibilityTextTest()
  progressAccessibilityDescriptionTest()
  progressAccessibilityGroupTest()
  progressAccessibilityLevelTest()
  progressAccessibilityTextTest()
  customComponentAccessibilityDescriptionTest()
  customComponentAccessibilityGroupTest()
  customComponentAccessibilityLevelTest()
  customComponentAccessibilityTextTest()
  customComponentAlignSelfTest()
  customComponentFlexGrowTest()
  customComponentFlexBasisTest()
  customComponentFlexShrinkTest()
  customComponentWidthTest()
  customComponentHeightTest()
  customComponentBackgroundColorTest()
  customComponentPositionTest()
  customComponentBorderWidthTest()
  customComponentBorderColorTest()
  customComponentBorderRadiusTest()
  customComponentBorderStyleTest()
  customComponentSweepGradientTest()
  customComponentRadialGradientTest()
  customComponentTransformTest()
  customComponentMaskTest()
  customComponentBlendModeTest()
  customComponentForegroundBlurStyleTest()
  customComponentClipTest()
  customComponentLinearGradientTest()
  customComponentShadowTest()
  customComponentScaleTest()
  customComponentMarginTest()
  customComponentConstraintSizeTest()
  customComponentContrastTest()
  customComponentGrayscaleTest()
  customComponentInvertTest()
  customComponentOpacityTest()
  customComponentSepiaTest()
  customComponentAlignTest()
  customComponentDirectionTest()
  customDialogMaskColorTest()
  xComponentTypeTest()
  xComponentSourceIdTest()
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
  commonAttrsShadowTest()
  commonAttrsScaleTest()
  commonAttrsMarginTest()
  commonAttrsConstraintSizeTest()
  commonAttrsContrastTest()
  commonAttrsGrayscaleTest()
  commonAttrsInvertTest()
  commonAttrsOpacityTest()
  commonAttrsSepiaTest()
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
  imageObjectFitTest()
  imageObjectRepeatTest()
  imageOpacityTest()
  imageRadialGradientTest()
  imageRotateTest()
  imageSaturateTest()
  imageScaleTest()
  imageShadowTest()
  imageSrcTest()
  imageSweepGradientTest()
  imageTransformTest()
  imageTranslateTest()
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
  listShadowTest()
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
  listItemShadowTest()
  listItemLinearGradientTest()
  stackAlignTest()
  stackBackgroundBlurStyleTest()
  stackBackgroundColorTest()
  stackBackgroundImageTest()
  stackBackgroundImagePositionTest()
  stackBackgroundImageSizeTest()
  stackBorderColorTest()
  stackBorderRadiusTest()
  stackBorderStyleTest()
  stackBorderWidthTest()
  stackBrightnessTest()
  stackClipTest()
  stackHeightTest()
  stackIdTest()
  stackLinearGradientTest()
  stackMarginTest()
  stackOpacityTest()
  stackPositionTest()
  stackRotateTest()
  stackSaturateTest()
  stackScaleTest()
  stackShadowTest()
  stackTransformTest()
  stackTransitionTest()
  stackTranslateTest()
  stackWidthTest()
  TextStyleGraphicTest()
  toggleBackgroundColorTest()
  toggleClipTest()
  toggleFocusableTest()
  toggleHeightTest()
  toggleMarginTest()
  togglePositionTest()
  toggleSelectedColorTest()
  toggleSwitchPointColorTest()
  toggleWidthTest()
  toggleSwitchTest()
  swiperAutoPlayTest()
  swiperBackgroundColorTest()
  swiperBackgroundImageTest()
  swiperClipTest()
  swiperCurveTest()
  swiperDisableSwipeTest()
  swiperDisplayArrowTest()
  swiperDisplayCountTest()
  swiperDurationTest()
  swiperHeightTest()
  swiperIndexTest()
  swiperIndicatorTest()
  swiperIntervalTest()
  swiperItemSpaceTest()
  swiperLoopTest()
  swiperPositionTest()
  swiperVerticalTest()
  swiperWidthTest()
  swiperCachedCountTest()
  textWidthTest()
  textHeightTest()
  textPositionTest()
  scrollWidthTest()
  scrollHeightTest()
  scrollPositionTest()
  imageWidthTest()
  imageHeightTest()
  imagePositionTest()
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
  scrollShadowTest()
  scrollEdgeEffectTest()
  scrollFrictionTest()
  scrollScrollSnapTest()
  scrollOverlayTest()
  scrollLinearGradientTest()
  scrollSaturateTest()
  scrollPageEnableTest()
  textAlignTest()
  textBackgroundColorTest()
  textBackgroundImageTest()
  textBaselineOffsetTest()
  textBorderColorTest()
  textBorderRadiusTest()
  textBorderWidthTest()
  textClipTest()
  textCopyOptionTest()
  textDecorationTest()
  textFontColorTest()
  textFontFamilyTest()
  textFontSizeTest()
  textFontStyleTest()
  textFontTest()
  textFontWeightTest()
  textHeightAdaptivePolicyTest()
  textLetterSpacingTest()
  textLinearGradientTest()
  textLineHeightTest()
  textMaskTest()
  textMaxFontSizeTest()
  textMaxLinesTest()
  textMinFontSizeTest()
  textOffsetTest()
  textOpacityTest()
  textOverlayTest()
  textPaddingTest()
  textRadialGradientTest()
  textScaleTest()
  textShadowTest()
  textSweepGradientTest()
  textTextAlignTest()
  textTextCaseTest()
  textTextIndentTest()
  textTextOverflowTest()
  textTextShadowTest()
  textTransformTest()
  textVisibilityTest()
  textLineBreakStrategyTest()
  textAlignRulesTest()
  customDialogCustomStyleTest()
  customDialogAlignmentTest()
  customDialogCloseTest()
  customDialogOpenTest()
  calendarPickerTextStyleTest()
  calendarPickerEdgeAlignTest()
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
  calendarPickerWidthTest()
  checkboxWidthTest()
  checkboxHeightTest()
  flexWidthTest()
  flexHeightTest()
  xComponentWidthTest()
  xComponentHeightTest()
  textAreaWidthTest()
  textAreaHeightTest()
  textAreaPositionTest()
  textInputWidthTest()
  textInputHeightTest()
  textInputPositionTest()
  textInputShowPasswordIconTest()
  textInputCaretStyleTest()
  textInputSelectedBackgroundColorTest()
  textInputTypeTest()
  textInputEnterKeyTypeTest()
  textInputEnableKeyboardOnFocusTest()
  columnWidthTest()
  columnHeightTest()
  rowHeightTest()
  sliderWidthTest()
  sliderHeightTest()
  columnPaddingTest()
  columnForegroundBlurStyleTest()
  commonAttrsAlignTest()
  commonAttrsDirectionTest()
  commonAttrsEnabledTest()
  commonAttrsFocusableTest()
  commonEventOnAppearTest()
  commonEventOnAreaChangeTest()
  commonEventOnBlurTest()
  commonEventOnFocusTest()
  commonEventOnTouchTest()
  PointEventOnTouchTest()
  commonEventOnClickTest()
  commonAttrsHitTestBehaviorTest()
  commonAttrsIdTest()
  imageHitTestBehaviorTest()
  imageIdTest()
  imageOnCompleteTest()
  imageOnErrorTest()
  listHitTestBehaviorTest()
  listItemHitTestBehaviorTest()
  ListSwipeActionItemTest()
  toggleOnChangeTest()
  toggleEnabledTest()
  scrollNestedScrollTest()
  scrollOnScrollTest()
  scrollOnScrollFrameBeginTest()
  scrollOnScrollStartTest()
  scrollOnScrollStopTest()
  scrollOnAppearTest()
  scrollOnScrollEdgeTest()
  scrollScrollEdgeTest()
  scrollHitTestBehaviorTest()
  stackOnAreaChangeTest()
  stackHitTestBehaviorTest()
  stackOnTouchTest()
  textEnabledTest()
  textAreaKeyTest()
  textAreaEnabledTest()
  textInputEnabledTest()
  textInputOnChangeTest()
  calendarPickerEnabledTest()
  checkboxEnabledTest()
  sliderEnabledTest()
  datePickerEnabledTest()
  calendarPickerOnChangeTest()
  textPickerOnChangeTest()
  datePickerOnDateChangeTest()
  timePickerOnChangeTest()
  customComponentHitTestBehaviorTest()
  customComponentIdTest()
  customComponentEnabledTest()
  customComponentFocusableTest()
  customComponentOnAppearTest()
  customComponentOnAreaChangeTest()
  customComponentOnBlurTest()
  customComponentOnFocusTest()
  customComponentOnTouchTest()
  customComponentOnClickTest()
  textInputKeyTest()
  textInputResponseRegionTest()
  textInputClearButtonModeTest()
  textAreaOnFocusTest()
  textAreaOnBlurTest()
  textAreaOnChangeTest()
  textAreaDefaultFocusTest()
  textAreaResponseRegionTest()
  refreshOnStateChangeTest()
  refreshOnRefreshingTest()
  sliderOnChangeTest()
  checkboxOnChangeTest()
  buttonOnClickTest()
  textInputOnBlurTest()
  textInputOnSubmitTest()
  textInputOnCutTest()
  textInputOnPasteTest()
  customComponentOnMeasureTest()
  customComponentOnLayoutTest()
  customComponentOnDrawTest()
  scrollCurrentOffsetTest()
  scrollScrollToTest()
  TestArkUIAddApi()
  testArkUI()
  testAnimationTest()
  testWaterFlower()
  textInputOnFocusTest()
  accessibilityStateTest()
  relativecontaineAlignmentRuleOptionTest()
  relativecontaineBarrierOptionTest()
  testGesture()
  gestureNestScrollTest()
  customComponentEventTest()
  commonAttrsAnimateTest()
  drawableDescriptorCreateTest()
  nodeContentTest()
  nativeXComponentTest()
  mouseEventTest()
  pointerEventTest()
  nativeTest()
  DialogDismissEventTest()
  SystemColorFontChangeTest()
  DragGetDragEventTest()
  DragEventGetDataTypesTest()
  DragEventDisableDefaultDropAnimationTest()
  DragGetPreDragStatusTest()
  DragEventSetSuggestedDropOperationTest()
  DragEventSetDragResultTest()
  DragEventGetDataTypesCountTest()
  DragEventGetDragResultTest()
  DragEventGetDropOperationTest()
  DragSetGetUdmfDataTest()
  DragEventGetXYTest()
  DragEventGetWidthHeightTest()
  DragEventGetModifierKeyStatesTest()
  DragSetDragEventStrictReportTest()
  DragAllowDropDataTypesTest()
  DragSetNodeDragPreviewTest()
  DragDragPreviewOptionTest()
  DragDragActionTest()
  DragActionCreateDragActionTest()
  DragActionSetPointerIdTest()
  DragActionSetDragPreviewOptionTest()
  DragActionSetTouchPointXYTest()
  DragActionRegisterStatusListenerTest()
}
