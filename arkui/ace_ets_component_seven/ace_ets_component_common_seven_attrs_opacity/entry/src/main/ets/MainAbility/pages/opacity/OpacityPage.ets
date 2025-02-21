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
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class BadgeModifier implements AttributeModifier<BadgeAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: BadgeAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class BlankModifier implements AttributeModifier<BlankAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: BlankAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ButtonModifier implements AttributeModifier<ButtonAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ButtonAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: CalendarPickerAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: CheckboxAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: CheckboxGroupAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ColumnModifier implements AttributeModifier<ColumnAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ColumnAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ColumnSplitAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class CounterModifier implements AttributeModifier<CounterAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: CounterAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: DataPanelAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: DatePickerAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class DividerModifier implements AttributeModifier<DividerAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: DividerAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: EffectComponentAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class FlexModifier implements AttributeModifier<FlexAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: FlexAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: FlowItemAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: FormComponentAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: FormLinkAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class GaugeModifier implements AttributeModifier<GaugeAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: GaugeAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class GridModifier implements AttributeModifier<GridAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: GridAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class GridColModifier implements AttributeModifier<GridColAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: GridColAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class GridItemModifier implements AttributeModifier<GridItemAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: GridItemAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class GridRowModifier implements AttributeModifier<GridRowAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: GridRowAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: HyperlinkAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ImageAnimatorAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ImageSpanAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ImageModifier implements AttributeModifier<ImageAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ImageAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ListModifier implements AttributeModifier<ListAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ListAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ListItemModifier implements AttributeModifier<ListItemAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ListItemAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ListItemGroupAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: LoadingProgressAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: MarqueeAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class MenuModifier implements AttributeModifier<MenuAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: MenuAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: MenuItemAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: MenuItemGroupAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: NavDestinationAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class NavigationModifier implements AttributeModifier<NavigationAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: NavigationAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: NavigatorAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class NavRouterModifier implements AttributeModifier<NavRouterAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: NavRouterAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: PatternLockAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: PluginComponentAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: QRCodeAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class RadioModifier implements AttributeModifier<RadioAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: RadioAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class RatingModifier implements AttributeModifier<RatingAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: RatingAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class RefreshModifier implements AttributeModifier<RefreshAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: RefreshAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: RelativeContainerAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: RemoteWindowAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: RichEditorAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class RichTextModifier implements AttributeModifier<RichTextAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: RichTextAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class RowModifier implements AttributeModifier<RowAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: RowAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: RowSplitAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ScrollModifier implements AttributeModifier<ScrollAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ScrollAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ScrollBarAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class SearchModifier implements AttributeModifier<SearchAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: SearchAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class SelectModifier implements AttributeModifier<SelectAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: SelectAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: SideBarContainerAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class SliderModifier implements AttributeModifier<SliderAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: SliderAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class StackModifier implements AttributeModifier<StackAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: StackAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class StepperModifier implements AttributeModifier<StepperAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: StepperAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: StepperItemAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class SwiperModifier implements AttributeModifier<SwiperAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: SwiperAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class TabContentModifier implements AttributeModifier<TabContentAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: TabContentAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class TabsModifier implements AttributeModifier<TabsAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: TabsAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class TextModifier implements AttributeModifier<TextAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: TextAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: TextAreaAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class TextClockModifier implements AttributeModifier<TextClockAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: TextClockAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class TextInputModifier implements AttributeModifier<TextInputAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: TextInputAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: TextPickerAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: TextTimerAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: TimePickerAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class ToggleModifier implements AttributeModifier<ToggleAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: ToggleAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: WaterFlowAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class WebModifier implements AttributeModifier<WebAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: WebAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }
  class XComponentModifier implements AttributeModifier<XComponentAttribute> {
    mOpacity: number | Resource = 0.6
    applyNormalAttribute(instance: XComponentAttribute): void {
      console.info(`opacity page show ${JSON.stringify(this.mOpacity)}`)
      instance.opacity(this.mOpacity)
    }
  }

@Entry
@Component
struct opacityPage {
  @State _opacity: number | Resource = 1
  @State _opacityAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _opacityBadgeMod: BadgeModifier = new BadgeModifier()
  @State _opacityBlankMod: BlankModifier = new BlankModifier()
  @State _opacityButtonMod: ButtonModifier = new ButtonModifier()
  @State _opacityCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _opacityCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _opacityCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _opacityColumnMod: ColumnModifier = new ColumnModifier()
  @State _opacityColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _opacityCounterMod: CounterModifier = new CounterModifier()
  @State _opacityDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _opacityDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _opacityDividerMod: DividerModifier = new DividerModifier()
  @State _opacityEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _opacityFlexMod: FlexModifier = new FlexModifier()
  @State _opacityFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _opacityFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _opacityFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _opacityGaugeMod: GaugeModifier = new GaugeModifier()
  @State _opacityGridMod: GridModifier = new GridModifier()
  @State _opacityGridColMod: GridColModifier = new GridColModifier()
  @State _opacityGridItemMod: GridItemModifier = new GridItemModifier()
  @State _opacityGridRowMod: GridRowModifier = new GridRowModifier()
  @State _opacityHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _opacityImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _opacityImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _opacityImageMod: ImageModifier = new ImageModifier()
  @State _opacityListMod: ListModifier = new ListModifier()
  @State _opacityListItemMod: ListItemModifier = new ListItemModifier()
  @State _opacityListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _opacityLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _opacityMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _opacityMenuMod: MenuModifier = new MenuModifier()
  @State _opacityMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _opacityMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _opacityNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _opacityNavRouterMod: NavRouterModifier = new NavRouterModifier()
  @State _opacityNavigationMod: NavigationModifier = new NavigationModifier()
  @State _opacityNavigatorMod: NavigatorModifier = new NavigatorModifier()
  @State _opacityPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _opacityPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _opacityQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _opacityRadioMod: RadioModifier = new RadioModifier()
  @State _opacityRatingMod: RatingModifier = new RatingModifier()
  @State _opacityRefreshMod: RefreshModifier = new RefreshModifier()
  @State _opacityRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _opacityRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _opacityRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _opacityRichTextMod: RichTextModifier = new RichTextModifier()
  @State _opacityRowMod: RowModifier = new RowModifier()
  @State _opacityRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _opacityScrollMod: ScrollModifier = new ScrollModifier()
  @State _opacityScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _opacitySearchMod: SearchModifier = new SearchModifier()
  @State _opacitySelectMod: SelectModifier = new SelectModifier()
  @State _opacitySideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _opacitySliderMod: SliderModifier = new SliderModifier()
  @State _opacityStackMod: StackModifier = new StackModifier()
  @State _opacityStepperMod: StepperModifier = new StepperModifier()
  @State _opacityStepperItemMod: StepperItemModifier = new StepperItemModifier()
  @State _opacitySwiperMod: SwiperModifier = new SwiperModifier()
  @State _opacityTabContentMod: TabContentModifier = new TabContentModifier()
  @State _opacityTabsMod: TabsModifier = new TabsModifier()
  @State _opacityTextMod: TextModifier = new TextModifier()
  @State _opacityTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _opacityTextClockMod: TextClockModifier = new TextClockModifier()
  @State _opacityTextInputMod: TextInputModifier = new TextInputModifier()
  @State _opacityTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _opacityTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _opacityTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _opacityToggleMod: ToggleModifier = new ToggleModifier()
  @State _opacityUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _opacityWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _opacityWebMod: WebModifier = new WebModifier()
  @State _opacityXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = router.getParams() ? router.getParams()['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? router.getParams()['view']['componentKey'] : ''
  @State parentWidth: number = router.getParams() ? router.getParams()['view']['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? router.getParams()['view']['parentHeight'] : 0
  @State columns: number = router.getParams() ? router.getParams()['view']['columns'] : 0
  @State gutter: number = router.getParams() ? router.getParams()['view']['gutter'] : 0
  @State parentComponentKey: string = router.getParams() ? router.getParams()['view']['parentComponentKey'] : ''

  onPageShow() {
    console.info('opacity page show called ')
    attrsManager.registerDataChange(value => {
      console.info('[registerDataChange] ' + JSON.stringify(value.opacity))
      this._opacityAlphabetIndexerMod.mOpacity = value.opacity
      this._opacityBadgeMod.mOpacity = value.opacity
      this._opacityBlankMod.mOpacity = value.opacity
      this._opacityButtonMod.mOpacity = value.opacity
      this._opacityCalendarPickerMod.mOpacity = value.opacity
      this._opacityCheckboxMod.mOpacity = value.opacity
      this._opacityCheckboxGroupMod.mOpacity = value.opacity
      this._opacityColumnMod.mOpacity = value.opacity
      this._opacityColumnSplitMod.mOpacity = value.opacity
      this._opacityCounterMod.mOpacity = value.opacity
      this._opacityDataPanelMod.mOpacity = value.opacity
      this._opacityDatePickerMod.mOpacity = value.opacity
      this._opacityDividerMod.mOpacity = value.opacity
      this._opacityEffectComponentMod.mOpacity = value.opacity
      this._opacityFlexMod.mOpacity = value.opacity
      this._opacityFlowItemMod.mOpacity = value.opacity
      this._opacityFormComponentMod.mOpacity = value.opacity
      this._opacityFormLinkMod.mOpacity = value.opacity
      this._opacityGaugeMod.mOpacity = value.opacity
      this._opacityGridMod.mOpacity = value.opacity
      this._opacityGridColMod.mOpacity = value.opacity
      this._opacityGridItemMod.mOpacity = value.opacity
      this._opacityGridRowMod.mOpacity = value.opacity
      this._opacityHyperlinkMod.mOpacity = value.opacity
      this._opacityImageAnimatorMod.mOpacity = value.opacity
      this._opacityImageSpanMod.mOpacity = value.opacity
      this._opacityImageMod.mOpacity = value.opacity
      this._opacityListMod.mOpacity = value.opacity
      this._opacityListItemMod.mOpacity = value.opacity
      this._opacityListItemGroupMod.mOpacity = value.opacity
      this._opacityLoadingProgressMod.mOpacity = value.opacity
      this._opacityMarqueeMod.mOpacity = value.opacity
      this._opacityMenuMod.mOpacity = value.opacity
      this._opacityMenuItemMod.mOpacity = value.opacity
      this._opacityMenuItemGroupMod.mOpacity = value.opacity
      this._opacityNavDestinationMod.mOpacity = value.opacity
      this._opacityNavRouterMod.mOpacity = value.opacity
      this._opacityNavigationMod.mOpacity = value.opacity
      this._opacityNavigatorMod.mOpacity = value.opacity
      this._opacityPatternLockMod.mOpacity = value.opacity
      this._opacityPluginComponentMod.mOpacity = value.opacity
      this._opacityQRCodeMod.mOpacity = value.opacity
      this._opacityRadioMod.mOpacity = value.opacity
      this._opacityRatingMod.mOpacity = value.opacity
      this._opacityRefreshMod.mOpacity = value.opacity
      this._opacityRelativeContainerMod.mOpacity = value.opacity
      this._opacityRemoteWindowMod.mOpacity = value.opacity
      this._opacityRichEditorMod.mOpacity = value.opacity
      this._opacityRichTextMod.mOpacity = value.opacity
      this._opacityRowMod.mOpacity = value.opacity
      this._opacityRowSplitMod.mOpacity = value.opacity
      this._opacityScrollMod.mOpacity = value.opacity
      this._opacityScrollBarMod.mOpacity = value.opacity
      this._opacitySearchMod.mOpacity = value.opacity
      this._opacitySelectMod.mOpacity = value.opacity
      this._opacitySideBarContainerMod.mOpacity = value.opacity
      this._opacitySliderMod.mOpacity = value.opacity
      this._opacityStackMod.mOpacity = value.opacity
      this._opacityStepperMod.mOpacity = value.opacity
      this._opacityStepperItemMod.mOpacity = value.opacity
      this._opacitySwiperMod.mOpacity = value.opacity
      this._opacityTabContentMod.mOpacity = value.opacity
      this._opacityTabsMod.mOpacity = value.opacity
      this._opacityTextMod.mOpacity = value.opacity
      this._opacityTextAreaMod.mOpacity = value.opacity
      this._opacityTextClockMod.mOpacity = value.opacity
      this._opacityTextInputMod.mOpacity = value.opacity
      this._opacityTextPickerMod.mOpacity = value.opacity
      this._opacityTextTimerMod.mOpacity = value.opacity
      this._opacityTimePickerMod.mOpacity = value.opacity
      this._opacityToggleMod.mOpacity = value.opacity
      this._opacityUIExtensionComponentMod.mOpacity = value.opacity
      this._opacityWaterFlowMod.mOpacity = value.opacity
      this._opacityWebMod.mOpacity = value.opacity
      this._opacityXComponentMod.mOpacity = value.opacity
    })
  }

  @Styles commonStyle(){
    // .opacity(this._opacity)
    .height('100%')
    .gridSpan(1)
    .key(this.componentKey)
  }

  build() {
    GridContainer({ columns: this.columns, gutter: this.gutter, margin: 0 }) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').commonStyle().attributeModifier(this._opacityButtonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle().attributeModifier(this._opacityTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .commonStyle().attributeModifier(this._opacityAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle().attributeModifier(this._opacityBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle().attributeModifier(this._opacityCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).commonStyle().attributeModifier(this._opacityCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle().attributeModifier(this._opacityDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle().attributeModifier(this._opacityDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle().attributeModifier(this._opacityDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle().attributeModifier(this._opacityGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle().attributeModifier(this._opacityImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle().attributeModifier(this._opacityImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle().attributeModifier(this._opacityLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle().attributeModifier(this._opacityMarqueeMod)
        } else if (this.targetView == 'Navigation') {
          Navigation() {
          }.commonStyle().attributeModifier(this._opacityNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
          }.backgroundColor(Color.Yellow).commonStyle().attributeModifier(this._opacityMenuMod)
        } else if (this.targetView == 'NavRouter') {
          NavRouter() {
            Row() {
              Image($r('app.media.icon'))
            }

            NavDestination() {
              Text('NavDestination').fontSize(10)
            }
          }.commonStyle().attributeModifier(this._opacityNavRouterMod)
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle()
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').commonStyle().attributeModifier(this._opacityQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle().attributeModifier(this._opacityRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).commonStyle().attributeModifier(this._opacityRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle().attributeModifier(this._opacityScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle().attributeModifier(this._opacitySearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle().attributeModifier(this._opacitySelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle().attributeModifier(this._opacitySliderMod)
        } else if (this.targetView == 'Stepper') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
          }.commonStyle().attributeModifier(this._opacityStepperMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle().attributeModifier(this._opacityTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle().attributeModifier(this._opacityTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .commonStyle().attributeModifier(this._opacityTextPickerMod)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle().attributeModifier(this._opacityTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle().attributeModifier(this._opacityTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle().attributeModifier(this._opacityToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebController() })
          .commonStyle().attributeModifier(this._opacityWebMod)
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
          }.commonStyle().attributeModifier(this._opacityBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle().attributeModifier(this._opacityColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle().attributeModifier(this._opacityColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle().attributeModifier(this._opacityCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle().attributeModifier(this._opacityFlexMod)
        } else if (this.targetView == 'GridRow') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
            Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                Row().width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
          }.commonStyle().attributeModifier(this._opacityGridRowMod)
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
          .commonStyle().attributeModifier(this._opacityGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle().height('100%').width('100%').attributeModifier(this._opacityListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle().attributeModifier(this._opacityListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle().attributeModifier(this._opacityListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          Navigator() {
            Text('Go to back page').width('100%').height(20)
          }.commonStyle().backgroundColor(Color.Red).attributeModifier(this._opacityNavigatorMod)
        } else if (this.targetView == 'Panel') {
          Panel(true) {
            Text('Text')
          }.backgroundColor(Color.Yellow).commonStyle()
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle().attributeModifier(this._opacityRefreshMod)
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
          }.commonStyle().attributeModifier(this._opacityRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle().attributeModifier(this._opacityRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle().attributeModifier(this._opacityRowSplitMod)
        } else if (this.targetView == 'Scroll') {
          Scroll() {
            Column() {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item) => {
                Text('Scroll' + item.toString())
                  .width('90%')
                  .height(50)
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
              }, item => item)
            }.width('100%')
          }.scrollBar(BarState.On).commonStyle().attributeModifier(this._opacityScrollMod)
        } else if (this.targetView == 'SideBarContainer') {
          SideBarContainer(SideBarContainerType.Embed) {
            Column() {
              ForEach([1, 2, 3], (item) => {
                Column({ space: 5 }) {
                  Image($r('app.media.icon')).width(50).height(50)
                  Text('Index0' + item).fontSize(25)
                }
              })
            }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

            Column() {
              Text('SideBarContainer content').fontSize(25)
            }.backgroundColor(Color.Orange)
          }.commonStyle().attributeModifier(this._opacitySideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle().attributeModifier(this._opacityStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: string) => {
              Text('Swiper' + item).width('90%').height(50)
            }, item => item)
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle().attributeModifier(this._opacitySwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle().attributeModifier(this._opacityTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle().attributeModifier(this._opacityTabContentMod)
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
            }, item => item)
          }.commonStyle().attributeModifier(this._opacityWaterFlowMod)
        } else if (this.targetView == 'StepperItem') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
            .backgroundColor(Color.Red)
            .commonStyle().attributeModifier(this._opacityStepperItemMod)
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
            .commonStyle().attributeModifier(this._opacityGridColMod)
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
              .commonStyle().attributeModifier(this._opacityFlowItemMod)
              .backgroundColor(Color.Yellow)
            }, item => item)
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
            .commonStyle().attributeModifier(this._opacityGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
                .commonStyle().attributeModifier(this._opacityMenuItemMod)
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
              .commonStyle().attributeModifier(this._opacityMenuItemGroupMod)
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