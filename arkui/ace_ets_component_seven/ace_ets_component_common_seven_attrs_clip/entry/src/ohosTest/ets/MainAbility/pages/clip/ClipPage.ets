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

// add Modifier
  class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class BadgeModifier implements AttributeModifier<BadgeAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: BadgeAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class BlankModifier implements AttributeModifier<BlankAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: BlankAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ButtonModifier implements AttributeModifier<ButtonAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ButtonAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: CalendarPickerAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: CheckboxAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: CheckboxGroupAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ColumnModifier implements AttributeModifier<ColumnAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ColumnAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ColumnSplitAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class CounterModifier implements AttributeModifier<CounterAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: CounterAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: DataPanelAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: DatePickerAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class DividerModifier implements AttributeModifier<DividerAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: DividerAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: EffectComponentAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class FlexModifier implements AttributeModifier<FlexAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: FlexAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: FlowItemAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: FormComponentAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: FormLinkAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class GaugeModifier implements AttributeModifier<GaugeAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: GaugeAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class GridModifier implements AttributeModifier<GridAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: GridAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class GridColModifier implements AttributeModifier<GridColAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: GridColAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class GridItemModifier implements AttributeModifier<GridItemAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: GridItemAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class GridRowModifier implements AttributeModifier<GridRowAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: GridRowAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: HyperlinkAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ImageAnimatorAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ImageSpanAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ImageModifier implements AttributeModifier<ImageAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ImageAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ListModifier implements AttributeModifier<ListAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ListAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ListItemModifier implements AttributeModifier<ListItemAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ListItemAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ListItemGroupAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: LoadingProgressAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: MarqueeAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class MenuModifier implements AttributeModifier<MenuAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: MenuAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: MenuItemAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: MenuItemGroupAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: NavDestinationAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class NavigationModifier implements AttributeModifier<NavigationAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: NavigationAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: NavigatorAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: NavRouterAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: PatternLockAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: PluginComponentAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: QRCodeAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class RadioModifier implements AttributeModifier<RadioAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: RadioAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class RatingModifier implements AttributeModifier<RatingAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: RatingAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class RefreshModifier implements AttributeModifier<RefreshAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: RefreshAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: RelativeContainerAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: RemoteWindowAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: RichEditorAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class RichTextModifier implements AttributeModifier<RichTextAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: RichTextAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class RowModifier implements AttributeModifier<RowAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: RowAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: RowSplitAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ScrollModifier implements AttributeModifier<ScrollAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ScrollAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ScrollBarAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class SearchModifier implements AttributeModifier<SearchAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: SearchAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class SelectModifier implements AttributeModifier<SelectAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: SelectAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: SideBarContainerAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class SliderModifier implements AttributeModifier<SliderAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: SliderAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class StackModifier implements AttributeModifier<StackAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: StackAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class StepperModifier implements AttributeModifier<StepperAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: StepperAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: StepperItemAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class SwiperModifier implements AttributeModifier<SwiperAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: SwiperAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class TabContentModifier implements AttributeModifier<TabContentAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: TabContentAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class TabsModifier implements AttributeModifier<TabsAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: TabsAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class TextModifier implements AttributeModifier<TextAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: TextAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: TextAreaAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class TextClockModifier implements AttributeModifier<TextClockAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: TextClockAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class TextInputModifier implements AttributeModifier<TextInputAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: TextInputAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: TextPickerAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: TextTimerAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: TimePickerAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class ToggleModifier implements AttributeModifier<ToggleAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: ToggleAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: WaterFlowAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class WebModifier implements AttributeModifier<WebAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: WebAttribute): void {
      instance.clip(this.mClip)
    }
  }
  class XComponentModifier implements AttributeModifier<XComponentAttribute> {
    mClip: boolean = false
    applyNormalAttribute(instance: XComponentAttribute): void {
      instance.clip(this.mClip)
    }
  }

@Entry
@Component
struct clipPage {
  @State _clip: boolean = true
  @State _clipAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _clipBadgeMod: BadgeModifier = new BadgeModifier()
  @State _clipBlankMod: BlankModifier = new BlankModifier()
  @State _clipButtonMod: ButtonModifier = new ButtonModifier()
  @State _clipCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _clipCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _clipCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _clipColumnMod: ColumnModifier = new ColumnModifier()
  @State _clipColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _clipCounterMod: CounterModifier = new CounterModifier()
  @State _clipDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _clipDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _clipDividerMod: DividerModifier = new DividerModifier()
  @State _clipEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _clipFlexMod: FlexModifier = new FlexModifier()
  @State _clipFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _clipFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _clipFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _clipGaugeMod: GaugeModifier = new GaugeModifier()
  @State _clipGridMod: GridModifier = new GridModifier()
  @State _clipGridColMod: GridColModifier = new GridColModifier()
  @State _clipGridItemMod: GridItemModifier = new GridItemModifier()
  @State _clipGridRowMod: GridRowModifier = new GridRowModifier()
  @State _clipHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _clipImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _clipImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _clipImageMod: ImageModifier = new ImageModifier()
  @State _clipListMod: ListModifier = new ListModifier()
  @State _clipListItemMod: ListItemModifier = new ListItemModifier()
  @State _clipListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _clipLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _clipMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _clipMenuMod: MenuModifier = new MenuModifier()
  @State _clipMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _clipMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _clipNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _clipNavRouterMod: NavRouterModifier = new NavRouterModifier()
  @State _clipNavigationMod: NavigationModifier = new NavigationModifier()
  @State _clipNavigatorMod: NavigatorModifier = new NavigatorModifier()
  @State _clipPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _clipPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _clipQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _clipRadioMod: RadioModifier = new RadioModifier()
  @State _clipRatingMod: RatingModifier = new RatingModifier()
  @State _clipRefreshMod: RefreshModifier = new RefreshModifier()
  @State _clipRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _clipRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _clipRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _clipRichTextMod: RichTextModifier = new RichTextModifier()
  @State _clipRowMod: RowModifier = new RowModifier()
  @State _clipRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _clipScrollMod: ScrollModifier = new ScrollModifier()
  @State _clipScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _clipSearchMod: SearchModifier = new SearchModifier()
  @State _clipSelectMod: SelectModifier = new SelectModifier()
  @State _clipSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _clipSliderMod: SliderModifier = new SliderModifier()
  @State _clipStackMod: StackModifier = new StackModifier()
  @State _clipStepperMod: StepperModifier = new StepperModifier()
  @State _clipStepperItemMod: StepperItemModifier = new StepperItemModifier()
  @State _clipSwiperMod: SwiperModifier = new SwiperModifier()
  @State _clipTabContentMod: TabContentModifier = new TabContentModifier()
  @State _clipTabsMod: TabsModifier = new TabsModifier()
  @State _clipTextMod: TextModifier = new TextModifier()
  @State _clipTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _clipTextClockMod: TextClockModifier = new TextClockModifier()
  @State _clipTextInputMod: TextInputModifier = new TextInputModifier()
  @State _clipTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _clipTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _clipTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _clipToggleMod: ToggleModifier = new ToggleModifier()
  @State _clipUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _clipWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _clipWebMod: WebModifier = new WebModifier()
  @State _clipXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['componentKey'] : ''
  @State parentWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentHeight'] : 0
  @State columns: number = router.getParams() ? (router.getParams() as ESObject)['view']['columns'] : 0
  @State gutter: number = router.getParams() ? (router.getParams() as ESObject)['view']['gutter'] : 0
  @State parentComponentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['parentComponentKey'] : ''

  onPageShow() {
    attrsManager.registerDataChange((value:ESObject) => {
      console.info('[registerDataChange] ' + JSON.stringify(value.clip))
      this._clipAlphabetIndexerMod.mClip = value.clip
      this._clipBadgeMod.mClip = value.clip
      this._clipBlankMod.mClip = value.clip
      this._clipButtonMod.mClip = value.clip
      this._clipCalendarPickerMod.mClip = value.clip
      this._clipCheckboxMod.mClip = value.clip
      this._clipCheckboxGroupMod.mClip = value.clip
      this._clipColumnMod.mClip = value.clip
      this._clipColumnSplitMod.mClip = value.clip
      this._clipCounterMod.mClip = value.clip
      this._clipDataPanelMod.mClip = value.clip
      this._clipDatePickerMod.mClip = value.clip
      this._clipDividerMod.mClip = value.clip
      this._clipEffectComponentMod.mClip = value.clip
      this._clipFlexMod.mClip = value.clip
      this._clipFlowItemMod.mClip = value.clip
      this._clipFormComponentMod.mClip = value.clip
      this._clipFormLinkMod.mClip = value.clip
      this._clipGaugeMod.mClip = value.clip
      this._clipGridMod.mClip = value.clip
      this._clipGridColMod.mClip = value.clip
      this._clipGridItemMod.mClip = value.clip
      this._clipGridRowMod.mClip = value.clip
      this._clipHyperlinkMod.mClip = value.clip
      this._clipImageAnimatorMod.mClip = value.clip
      this._clipImageSpanMod.mClip = value.clip
      this._clipImageMod.mClip = value.clip
      this._clipListMod.mClip = value.clip
      this._clipListItemMod.mClip = value.clip
      this._clipListItemGroupMod.mClip = value.clip
      this._clipLoadingProgressMod.mClip = value.clip
      this._clipMarqueeMod.mClip = value.clip
      this._clipMenuMod.mClip = value.clip
      this._clipMenuItemMod.mClip = value.clip
      this._clipMenuItemGroupMod.mClip = value.clip
      this._clipNavDestinationMod.mClip = value.clip
      this._clipNavRouterMod.mClip = value.clip
      this._clipNavigationMod.mClip = value.clip
      this._clipNavigatorMod.mClip = value.clip
      this._clipPatternLockMod.mClip = value.clip
      this._clipPluginComponentMod.mClip = value.clip
      this._clipQRCodeMod.mClip = value.clip
      this._clipRadioMod.mClip = value.clip
      this._clipRatingMod.mClip = value.clip
      this._clipRefreshMod.mClip = value.clip
      this._clipRelativeContainerMod.mClip = value.clip
      this._clipRemoteWindowMod.mClip = value.clip
      this._clipRichEditorMod.mClip = value.clip
      this._clipRichTextMod.mClip = value.clip
      this._clipRowMod.mClip = value.clip
      this._clipRowSplitMod.mClip = value.clip
      this._clipScrollMod.mClip = value.clip
      this._clipScrollBarMod.mClip = value.clip
      this._clipSearchMod.mClip = value.clip
      this._clipSelectMod.mClip = value.clip
      this._clipSideBarContainerMod.mClip = value.clip
      this._clipSliderMod.mClip = value.clip
      this._clipStackMod.mClip = value.clip
      this._clipStepperMod.mClip = value.clip
      this._clipStepperItemMod.mClip = value.clip
      this._clipSwiperMod.mClip = value.clip
      this._clipTabContentMod.mClip = value.clip
      this._clipTabsMod.mClip = value.clip
      this._clipTextMod.mClip = value.clip
      this._clipTextAreaMod.mClip = value.clip
      this._clipTextClockMod.mClip = value.clip
      this._clipTextInputMod.mClip = value.clip
      this._clipTextPickerMod.mClip = value.clip
      this._clipTextTimerMod.mClip = value.clip
      this._clipTimePickerMod.mClip = value.clip
      this._clipToggleMod.mClip = value.clip
      this._clipUIExtensionComponentMod.mClip = value.clip
      this._clipWaterFlowMod.mClip = value.clip
      this._clipWebMod.mClip = value.clip
      this._clipXComponentMod.mClip = value.clip
    })
  }

  @Styles commonStyle(){
    // .clip(this._clip)
    .height('100%')
    .gridSpan(1)
    .key(this.componentKey)
  }

  build() {
    GridContainer({ columns: this.columns, gutter: this.gutter, margin: 0 }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').commonStyle().attributeModifier(this._clipButtonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle().attributeModifier(this._clipTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .commonStyle().attributeModifier(this._clipAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle().attributeModifier(this._clipBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle().attributeModifier(this._clipCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).commonStyle().attributeModifier(this._clipCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle().attributeModifier(this._clipDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle().attributeModifier(this._clipDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle().attributeModifier(this._clipDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle().attributeModifier(this._clipGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle().attributeModifier(this._clipImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle().attributeModifier(this._clipImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle().attributeModifier(this._clipLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle().attributeModifier(this._clipMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation() {
          }.commonStyle().attributeModifier(this._clipNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
          }.backgroundColor(Color.Yellow).commonStyle().attributeModifier(this._clipMenuMod)
        } else if (this.targetView == 'NavRouter') {
          NavRouter() {
            Row() {
              Image($r('app.media.icon'))
            }

            NavDestination() {
              Text('NavDestination').fontSize(10)
            }
          }.commonStyle().attributeModifier(this._clipNavRouterMod)
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle()
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').commonStyle().attributeModifier(this._clipQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle().attributeModifier(this._clipRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).commonStyle().attributeModifier(this._clipRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle().attributeModifier(this._clipScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle().attributeModifier(this._clipSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle().attributeModifier(this._clipSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle().attributeModifier(this._clipSliderMod)
        } else if (this.targetView == 'Stepper') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
          }.commonStyle().attributeModifier(this._clipStepperMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle().attributeModifier(this._clipTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle().attributeModifier(this._clipTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .commonStyle().attributeModifier(this._clipTextPickerMod)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle().attributeModifier(this._clipTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle().attributeModifier(this._clipTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle().attributeModifier(this._clipToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebController() })
          .commonStyle().attributeModifier(this._clipWebMod)
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
          }.commonStyle().attributeModifier(this._clipBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle().attributeModifier(this._clipColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle().attributeModifier(this._clipColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle().attributeModifier(this._clipCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle().attributeModifier(this._clipFlexMod)
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
          }.commonStyle().attributeModifier(this._clipGridRowMod)
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
          .commonStyle().attributeModifier(this._clipGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle().height('100%').width('100%').attributeModifier(this._clipListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle().attributeModifier(this._clipListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle().attributeModifier(this._clipListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          Navigator() {
            Text('Go to back page').width('100%').height(20)
          }.commonStyle().backgroundColor(Color.Red).attributeModifier(this._clipNavigatorMod)
        } else if (this.targetView == 'Panel') {
          Panel(true) {
            Text('Text')
          }.backgroundColor(Color.Yellow).commonStyle()
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle().attributeModifier(this._clipRefreshMod)
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
          }.commonStyle().attributeModifier(this._clipRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle().attributeModifier(this._clipRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle().attributeModifier(this._clipRowSplitMod)
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
          }.scrollBar(BarState.On).commonStyle().attributeModifier(this._clipScrollMod)
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
          }.commonStyle().attributeModifier(this._clipSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle().attributeModifier(this._clipStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: string) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item:number) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle().attributeModifier(this._clipSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle().attributeModifier(this._clipTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle().attributeModifier(this._clipTabContentMod)
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
          }.commonStyle().attributeModifier(this._clipWaterFlowMod)
        } else if (this.targetView == 'StepperItem') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
            .backgroundColor(Color.Red)
            .commonStyle().attributeModifier(this._clipStepperItemMod)
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
            .commonStyle().attributeModifier(this._clipGridColMod)
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
              .commonStyle().attributeModifier(this._clipFlowItemMod)
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
            .commonStyle().attributeModifier(this._clipGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
                .commonStyle().attributeModifier(this._clipMenuItemMod)
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
              .commonStyle().attributeModifier(this._clipMenuItemGroupMod)
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