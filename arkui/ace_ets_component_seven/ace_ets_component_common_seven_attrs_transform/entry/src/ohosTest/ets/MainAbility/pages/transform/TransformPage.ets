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
import attrsManager from '../../common/AttrsManager';
import router from '@ohos.router'
import matrix4 from '@ohos.matrix4'

let matrix2 = matrix4.identity()
let matrix1 = matrix4.init([2.0, 0.0, 0.0, 0.0,
                            0.0, 2.0, 0.0, 0.0,
                            0.0, 0.0, 2.0, 0.0,
                            0.0, 0.0, 0.0, 2.0])
// add Modifier
  class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class BadgeModifier implements AttributeModifier<BadgeAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: BadgeAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class BlankModifier implements AttributeModifier<BlankAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: BlankAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ButtonModifier implements AttributeModifier<ButtonAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ButtonAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: CalendarPickerAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: CheckboxAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: CheckboxGroupAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ColumnModifier implements AttributeModifier<ColumnAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ColumnAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ColumnSplitAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class CounterModifier implements AttributeModifier<CounterAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: CounterAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: DataPanelAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: DatePickerAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class DividerModifier implements AttributeModifier<DividerAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: DividerAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: EffectComponentAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class FlexModifier implements AttributeModifier<FlexAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: FlexAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: FlowItemAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: FormComponentAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: FormLinkAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class GaugeModifier implements AttributeModifier<GaugeAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: GaugeAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class GridModifier implements AttributeModifier<GridAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: GridAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class GridColModifier implements AttributeModifier<GridColAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: GridColAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class GridItemModifier implements AttributeModifier<GridItemAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: GridItemAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class GridRowModifier implements AttributeModifier<GridRowAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: GridRowAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: HyperlinkAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ImageAnimatorAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ImageSpanAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ImageModifier implements AttributeModifier<ImageAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ImageAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ListModifier implements AttributeModifier<ListAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ListAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ListItemModifier implements AttributeModifier<ListItemAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ListItemAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ListItemGroupAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: LoadingProgressAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: MarqueeAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class MenuModifier implements AttributeModifier<MenuAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: MenuAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: MenuItemAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: MenuItemGroupAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: NavDestinationAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class NavigationModifier implements AttributeModifier<NavigationAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: NavigationAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: NavigatorAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: NavRouterAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: PatternLockAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: PluginComponentAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: QRCodeAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class RadioModifier implements AttributeModifier<RadioAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: RadioAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class RatingModifier implements AttributeModifier<RatingAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: RatingAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class RefreshModifier implements AttributeModifier<RefreshAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: RefreshAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: RelativeContainerAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: RemoteWindowAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: RichEditorAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class RichTextModifier implements AttributeModifier<RichTextAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: RichTextAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class RowModifier implements AttributeModifier<RowAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: RowAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: RowSplitAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ScrollModifier implements AttributeModifier<ScrollAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ScrollAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ScrollBarAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class SearchModifier implements AttributeModifier<SearchAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: SearchAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class SelectModifier implements AttributeModifier<SelectAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: SelectAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: SideBarContainerAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class SliderModifier implements AttributeModifier<SliderAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: SliderAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class StackModifier implements AttributeModifier<StackAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: StackAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class StepperModifier implements AttributeModifier<StepperAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: StepperAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: StepperItemAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class SwiperModifier implements AttributeModifier<SwiperAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: SwiperAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class TabContentModifier implements AttributeModifier<TabContentAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: TabContentAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class TabsModifier implements AttributeModifier<TabsAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: TabsAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class TextModifier implements AttributeModifier<TextAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: TextAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: TextAreaAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class TextClockModifier implements AttributeModifier<TextClockAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: TextClockAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class TextInputModifier implements AttributeModifier<TextInputAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: TextInputAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: TextPickerAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: TextTimerAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: TimePickerAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class ToggleModifier implements AttributeModifier<ToggleAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: ToggleAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: WaterFlowAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class WebModifier implements AttributeModifier<WebAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: WebAttribute): void {
      instance.transform(this.mTransform)
    }
  }
  class XComponentModifier implements AttributeModifier<XComponentAttribute> {
    mTransform: matrix4.Matrix4Transit = matrix1
    applyNormalAttribute(instance: XComponentAttribute): void {
      instance.transform(this.mTransform)
    }
  }

@Entry
@Component
struct transformPage {
  @State _transform: matrix4.Matrix4Transit = matrix2
  @State _transformAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _transformBadgeMod: BadgeModifier = new BadgeModifier()
  @State _transformBlankMod: BlankModifier = new BlankModifier()
  @State _transformButtonMod: ButtonModifier = new ButtonModifier()
  @State _transformCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _transformCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _transformCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _transformColumnMod: ColumnModifier = new ColumnModifier()
  @State _transformColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _transformCounterMod: CounterModifier = new CounterModifier()
  @State _transformDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _transformDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _transformDividerMod: DividerModifier = new DividerModifier()
  @State _transformEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _transformFlexMod: FlexModifier = new FlexModifier()
  @State _transformFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _transformFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _transformFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _transformGaugeMod: GaugeModifier = new GaugeModifier()
  @State _transformGridMod: GridModifier = new GridModifier()
  @State _transformGridColMod: GridColModifier = new GridColModifier()
  @State _transformGridItemMod: GridItemModifier = new GridItemModifier()
  @State _transformGridRowMod: GridRowModifier = new GridRowModifier()
  @State _transformHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _transformImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _transformImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _transformImageMod: ImageModifier = new ImageModifier()
  @State _transformListMod: ListModifier = new ListModifier()
  @State _transformListItemMod: ListItemModifier = new ListItemModifier()
  @State _transformListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _transformLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _transformMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _transformMenuMod: MenuModifier = new MenuModifier()
  @State _transformMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _transformMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _transformNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _transformNavRouterMod: NavRouterModifier = new NavRouterModifier()
  @State _transformNavigationMod: NavigationModifier = new NavigationModifier()
  @State _transformNavigatorMod: NavigatorModifier = new NavigatorModifier()
  @State _transformPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _transformPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _transformQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _transformRadioMod: RadioModifier = new RadioModifier()
  @State _transformRatingMod: RatingModifier = new RatingModifier()
  @State _transformRefreshMod: RefreshModifier = new RefreshModifier()
  @State _transformRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _transformRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _transformRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _transformRichTextMod: RichTextModifier = new RichTextModifier()
  @State _transformRowMod: RowModifier = new RowModifier()
  @State _transformRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _transformScrollMod: ScrollModifier = new ScrollModifier()
  @State _transformScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _transformSearchMod: SearchModifier = new SearchModifier()
  @State _transformSelectMod: SelectModifier = new SelectModifier()
  @State _transformSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _transformSliderMod: SliderModifier = new SliderModifier()
  @State _transformStackMod: StackModifier = new StackModifier()
  @State _transformStepperMod: StepperModifier = new StepperModifier()
  @State _transformStepperItemMod: StepperItemModifier = new StepperItemModifier()
  @State _transformSwiperMod: SwiperModifier = new SwiperModifier()
  @State _transformTabContentMod: TabContentModifier = new TabContentModifier()
  @State _transformTabsMod: TabsModifier = new TabsModifier()
  @State _transformTextMod: TextModifier = new TextModifier()
  @State _transformTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _transformTextClockMod: TextClockModifier = new TextClockModifier()
  @State _transformTextInputMod: TextInputModifier = new TextInputModifier()
  @State _transformTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _transformTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _transformTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _transformToggleMod: ToggleModifier = new ToggleModifier()
  @State _transformUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _transformWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _transformWebMod: WebModifier = new WebModifier()
  @State _transformXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['componentKey'] : ''
  @State parentWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentHeight'] : 0
  @State columns: number = router.getParams() ? (router.getParams() as ESObject)['view']['columns'] : 0
  @State gutter: number = router.getParams() ? (router.getParams() as ESObject)['view']['gutter'] : 0
  @State parentComponentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['parentComponentKey'] : ''

  onPageShow() {
    console.info('22222 transform page show called ')
    attrsManager.registerDataChange((value:ESObject) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.transform))
      this._transformAlphabetIndexerMod.mTransform = value.transform
      this._transformBadgeMod.mTransform = value.transform
      this._transformBlankMod.mTransform = value.transform
      this._transformButtonMod.mTransform = value.transform
      this._transformCalendarPickerMod.mTransform = value.transform
      this._transformCheckboxMod.mTransform = value.transform
      this._transformCheckboxGroupMod.mTransform = value.transform
      this._transformColumnMod.mTransform = value.transform
      this._transformColumnSplitMod.mTransform = value.transform
      this._transformCounterMod.mTransform = value.transform
      this._transformDataPanelMod.mTransform = value.transform
      this._transformDatePickerMod.mTransform = value.transform
      this._transformDividerMod.mTransform = value.transform
      this._transformEffectComponentMod.mTransform = value.transform
      this._transformFlexMod.mTransform = value.transform
      this._transformFlowItemMod.mTransform = value.transform
      this._transformFormComponentMod.mTransform = value.transform
      this._transformFormLinkMod.mTransform = value.transform
      this._transformGaugeMod.mTransform = value.transform
      this._transformGridMod.mTransform = value.transform
      this._transformGridColMod.mTransform = value.transform
      this._transformGridItemMod.mTransform = value.transform
      this._transformGridRowMod.mTransform = value.transform
      this._transformHyperlinkMod.mTransform = value.transform
      this._transformImageAnimatorMod.mTransform = value.transform
      this._transformImageSpanMod.mTransform = value.transform
      this._transformImageMod.mTransform = value.transform
      this._transformListMod.mTransform = value.transform
      this._transformListItemMod.mTransform = value.transform
      this._transformListItemGroupMod.mTransform = value.transform
      this._transformLoadingProgressMod.mTransform = value.transform
      this._transformMarqueeMod.mTransform = value.transform
      this._transformMenuMod.mTransform = value.transform
      this._transformMenuItemMod.mTransform = value.transform
      this._transformMenuItemGroupMod.mTransform = value.transform
      this._transformNavDestinationMod.mTransform = value.transform
      this._transformNavRouterMod.mTransform = value.transform
      this._transformNavigationMod.mTransform = value.transform
      this._transformNavigatorMod.mTransform = value.transform
      this._transformPatternLockMod.mTransform = value.transform
      this._transformPluginComponentMod.mTransform = value.transform
      this._transformQRCodeMod.mTransform = value.transform
      this._transformRadioMod.mTransform = value.transform
      this._transformRatingMod.mTransform = value.transform
      this._transformRefreshMod.mTransform = value.transform
      this._transformRelativeContainerMod.mTransform = value.transform
      this._transformRemoteWindowMod.mTransform = value.transform
      this._transformRichEditorMod.mTransform = value.transform
      this._transformRichTextMod.mTransform = value.transform
      this._transformRowMod.mTransform = value.transform
      this._transformRowSplitMod.mTransform = value.transform
      this._transformScrollMod.mTransform = value.transform
      this._transformScrollBarMod.mTransform = value.transform
      this._transformSearchMod.mTransform = value.transform
      this._transformSelectMod.mTransform = value.transform
      this._transformSideBarContainerMod.mTransform = value.transform
      this._transformSliderMod.mTransform = value.transform
      this._transformStackMod.mTransform = value.transform
      this._transformStepperMod.mTransform = value.transform
      this._transformStepperItemMod.mTransform = value.transform
      this._transformSwiperMod.mTransform = value.transform
      this._transformTabContentMod.mTransform = value.transform
      this._transformTabsMod.mTransform = value.transform
      this._transformTextMod.mTransform = value.transform
      this._transformTextAreaMod.mTransform = value.transform
      this._transformTextClockMod.mTransform = value.transform
      this._transformTextInputMod.mTransform = value.transform
      this._transformTextPickerMod.mTransform = value.transform
      this._transformTextTimerMod.mTransform = value.transform
      this._transformTimePickerMod.mTransform = value.transform
      this._transformToggleMod.mTransform = value.transform
      this._transformUIExtensionComponentMod.mTransform = value.transform
      this._transformWaterFlowMod.mTransform = value.transform
      this._transformWebMod.mTransform = value.transform
      this._transformXComponentMod.mTransform = value.transform
    })
  }

  @Styles commonStyle(){
    // .transform(this._transform)
    .height('100%')
    .gridSpan(1)
    .key(this.componentKey)
  }

  build() {
    GridContainer({ columns: this.columns, gutter: this.gutter, margin: 0 }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').commonStyle().attributeModifier(this._transformButtonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle().attributeModifier(this._transformTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .commonStyle().attributeModifier(this._transformAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle().attributeModifier(this._transformBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle().attributeModifier(this._transformCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).commonStyle().attributeModifier(this._transformCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle().attributeModifier(this._transformDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle().attributeModifier(this._transformDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle().attributeModifier(this._transformDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle().attributeModifier(this._transformGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle().attributeModifier(this._transformImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle().attributeModifier(this._transformImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle().attributeModifier(this._transformLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle().attributeModifier(this._transformMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation() {
          }.commonStyle().attributeModifier(this._transformNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
          }.backgroundColor(Color.Yellow).commonStyle().attributeModifier(this._transformMenuMod)
        } else if (this.targetView == 'NavRouter') {
          NavRouter() {
            Row() {
              Image($r('app.media.icon'))
            }

            NavDestination() {
              Text('NavDestination').fontSize(10)
            }
          }.commonStyle().attributeModifier(this._transformNavRouterMod)
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle()
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').commonStyle().attributeModifier(this._transformQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle().attributeModifier(this._transformRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).commonStyle().attributeModifier(this._transformRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle().attributeModifier(this._transformScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle().attributeModifier(this._transformSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle().attributeModifier(this._transformSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle().attributeModifier(this._transformSliderMod)
        } else if (this.targetView == 'Stepper') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
          }.commonStyle().attributeModifier(this._transformStepperMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle().attributeModifier(this._transformTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle().attributeModifier(this._transformTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .commonStyle().attributeModifier(this._transformTextPickerMod)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle().attributeModifier(this._transformTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle().attributeModifier(this._transformTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle().attributeModifier(this._transformToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebController() })
          .commonStyle().attributeModifier(this._transformWebMod)
        } else if (this.targetView == 'Circle') {
          Circle().commonStyle()
        } else if (this.targetView == 'Ellipse') {
          Ellipse().commonStyle()
        } else if (this.targetView == 'Line') {
          Line()
            .commonStyle()
            .startPoint([0, 0])
            .endPoint([50, 100])
            .backgroundColor(Color.Black)
        } else if (this.targetView == 'Polyline') {
          Polyline().commonStyle()
        } else if (this.targetView == 'Polygon') {
          Polygon().commonStyle()
        } else if (this.targetView == 'Path') {
          Path().commonStyle()
        } else if (this.targetView == 'Rect') {
          Rect().commonStyle()
        } else if (this.targetView == 'Shape') {
          Shape() {
            Rect().width(100).height(50)
          }.commonStyle()
        } else if (this.targetView == 'Badge') {
          Badge({
            count: 50,
            style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          }) {
            Button('message')
              .width(100).height(50).backgroundColor(0x317aff)
          }.commonStyle().attributeModifier(this._transformBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle().attributeModifier(this._transformColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle().attributeModifier(this._transformColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle().attributeModifier(this._transformCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle().attributeModifier(this._transformFlexMod)
        } else if (this.targetView == 'GridRow') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
            Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color:Color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                Row().width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
          }.commonStyle().attributeModifier(this._transformGridRowMod)
        } else if (this.targetView == 'Grid') {
          Grid() {
            ForEach(['0', '1', '2', '3', '4'], () => {
              ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                GridItem() {
                  Text(day).backgroundColor(Color.White)
                    .width('100%').height('100%').textAlign(TextAlign.Center)
                }
              })
            })
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .commonStyle().attributeModifier(this._transformGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle().height('100%').width('100%').attributeModifier(this._transformListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle().attributeModifier(this._transformListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle().attributeModifier(this._transformListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          Navigator() {
            Text('Go to back page').width('100%').height(20)
          }.commonStyle().backgroundColor(Color.Red).attributeModifier(this._transformNavigatorMod)
        } else if (this.targetView == 'Panel') {
          Panel(true) {
            Text('Text')
          }.backgroundColor(Color.Yellow).commonStyle()
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle().attributeModifier(this._transformRefreshMod)
        } else if (this.targetView == 'RelativeContainer') {
          RelativeContainer() {
            Row()
              .width(100)
              .height(100)
              .backgroundColor('#FF3333')
              .alignRules({
                top: { anchor: '__container__', align: VerticalAlign.Top },
                left: { anchor: '__container__', align: HorizontalAlign.Start }
              })
              .id('constraintSize')
          }.commonStyle().attributeModifier(this._transformRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle().attributeModifier(this._transformRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle().attributeModifier(this._transformRowSplitMod)
        } else if (this.targetView == 'Scroll') {
          Scroll() {
            Column() {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item:number) => {
                Text('Scroll' + item.toString())
                  .width('90%')
                  .height(50)
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
              }, (item:number) => item.toString())
            }.width('100%')
          }.scrollBar(BarState.On).commonStyle().attributeModifier(this._transformScrollMod)
        } else if (this.targetView == 'SideBarContainer') {
          SideBarContainer(SideBarContainerType.Embed) {
            Column() {
              ForEach([1, 2, 3], (item:number) => {
                Column({ space: 5 }) {
                  Image($r('app.media.icon')).width(50).height(50)
                  Text('Index0' + item).fontSize(25)
                }
              })
            }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

            Column() {
              Text('SideBarContainer content').fontSize(25)
            }.backgroundColor(Color.Orange)
          }.commonStyle().attributeModifier(this._transformSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle().attributeModifier(this._transformStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: string) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item:number) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle().attributeModifier(this._transformSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle().attributeModifier(this._transformTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle().attributeModifier(this._transformTabContentMod)
          }.width('100%').height('100%')
        } else if (this.targetView == 'WaterFlow') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
            }, (item:number) => item.toString())
          }.commonStyle().attributeModifier(this._transformWaterFlowMod)
        } else if (this.targetView == 'StepperItem') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
            .backgroundColor(Color.Red)
            .commonStyle().attributeModifier(this._transformStepperItemMod)
          }
          .backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle().attributeModifier(this._transformGridColMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'FlowItem') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
              .commonStyle().attributeModifier(this._transformFlowItemMod)
              .backgroundColor(Color.Yellow)
            }, (item:number) => item.toString())
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'GridItem') {
          Grid() {
            GridItem() {
              Text('4')
                .backgroundColor(0xFAEEE0)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }.rowStart(1).rowEnd(4)
            .commonStyle().attributeModifier(this._transformGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
                .commonStyle().attributeModifier(this._transformMenuItemMod)
            }.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
          }.width('100%').height('100%').backgroundColor(Color.Green)
        } else if (this.targetView == 'MenuItemGroup') {
          Row() {
            Menu() {
              MenuItemGroup({ header: 'MenuItemGroup' }) {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
              }
              .commonStyle().attributeModifier(this._transformMenuItemGroupMod)
            }.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
          }.width('100%').height('100%').backgroundColor(Color.Green)
        }
      }
      .width('100%')
      .height(this.parentHeight)
      .backgroundColor(Color.Pink)
      .key(this.parentComponentKey)
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Yellow)
  }
}