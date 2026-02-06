'use static';
/*
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
import { ListItemGroupView } from '../../view/markAnchor/ListItemGroupView';
import { NavRouterView } from '../../view/markAnchor/NavRouterView';
import { attrsManager } from '../../common/AttrsManager';
import { RouterParams, SetValue } from '../../common/Utils';
import router from '@ohos.router'
import {
  Entry,
  AttributeModifier,
  Component,
  $r,
  Web,
  GridCol,
  AlignRuleOption,
  Row,
  Button,
  Margin,
  IDataSource,
  DataChangeListener,
  SwiperController,
  Column,
  ColumnOptions,
  ClickEvent,
  RowOptions,
  LazyForEach,
  Text,
  FlexAlign,
  TextCase,
  TextDecorationType,
  Resource,
  VerticalAlign,
  HorizontalAlign,
  RelativeContainer,
  Color,
  Scroller,
  Menu,
  ScrollBar,
  TextTimer,
  NavigationAttribute,
  CommonMethod,

  ColumnSplit,
  RowSplit,
  Refresh,
  ListItemGroup,
  ImageFit,

  Shape,
  CheckboxGroupAttribute,
  ColumnAttribute,
  ColumnSplitAttribute,
  CounterAttribute,
  DataPanelAttribute,
  DatePickerAttribute,
  DividerAttribute,
  EffectComponentAttribute,
  FlexAttribute,
  FlowItemAttribute,
  FormComponentAttribute,
  FormLinkAttribute,
  GaugeAttribute,
  GridAttribute,
  GridColAttribute,
  GridItemAttribute,
  GridRowAttribute,
  HyperlinkAttribute,
  ImageAnimatorAttribute,
  ImageSpanAttribute,
  ImageAttribute,
  ListAttribute,
  ListItemAttribute,
  ListItemGroupAttribute,
  LoadingProgressAttribute,
  MarqueeAttribute,
  MenuAttribute,
  MenuItemAttribute,
  MenuItemGroupAttribute,
  NavDestinationAttribute,
  PatternLockAttribute,
  PluginComponentAttribute,
  QRCodeAttribute,
  RadioAttribute,
  RatingAttribute,
  RefreshAttribute,
  RelativeContainerAttribute,
  RemoteWindowAttribute,
  RichEditorAttribute,
  RichTextAttribute,
  RowAttribute,
  RowSplitAttribute,
  ScrollAttribute,
  ScrollBarAttribute,
  SearchAttribute,
  SelectAttribute,
  SideBarContainerAttribute,
  SliderAttribute,
  StackAttribute,
  SwiperAttribute,
  TabContentAttribute,
  TabsAttribute,
  TextAttribute,
  TextAreaAttribute,
  TextClockAttribute,
  TextInputAttribute,
  TextPickerAttribute,
  TextTimerAttribute,
  TimePickerAttribute,
  ToggleAttribute,
  UIExtensionComponentAttribute,
  WaterFlowAttribute,
  WebAttribute,
  XComponentAttribute,
  BadgeAttribute,
  BlankAttribute,
  CheckboxAttribute,
  CalendarPickerAttribute,
  ButtonAttribute,
  Rect,
  Path,
  Polygon,
  Polyline,
  Line,
  Ellipse,
  Circle,
  WaterFlow,
  Tabs,
  Swiper,
  Stack,
  SideBarContainer,
  Scroll,
  List,
  GridRow,
  Grid,
  Flex,
  Counter,
  Badge,
  Toggle,
  TimePicker,
  TextPicker,
  TextInput,
  TextClock,
  TextArea,
  Slider,
  Search,
  Rating,
  QRCode,
  Progress,
  AlphabetIndexer,
  ImageAnimator,
  Image,
  Navigation,
  Marquee,
  LoadingProgress,
  Gauge,
  Divider,
  DatePicker,
  DataPanel,
  CheckboxGroup,
  Checkbox,
  Select,
  SliderStyle,
  Radio,
  MenuItem,
  ProgressType,
  ToggleType,
  ForEach,
  GridRowDirection,
  BarState,
  SideBarContainerType,
  TextAlign,
  GridItem,
  BadgeStyle,
  BadgeParamWithNumber,
  GutterOption,
  BreakPoints,
  BreakpointsReference,
  GridCol,
  GridColOptions,
  GridColColumnOption,
  MenuItemOptions,
  Position,
  TabContent,
  Axis,
  ListItem,
  FlowItem,
  FlexDirection,
  MenuItemGroup,
  Blank,
  AlphabetIndexerAttribute,
  applyStyles,
  NavPathStack,
  Builder,
  NavDestination
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State ,StoragePropRef } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import webview from '@ohos.web.webview';
import router from '@ohos.router'
import udmfType from '@ohos.data.uniformTypeDescriptor';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: BlankAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: CounterAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: DividerAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: EffectComponentAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: FlexAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: FormComponentAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: GridAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: GridColAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ListAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: MenuAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class NavigatorModifier implements AttributeModifier<NavigationAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class NavRouterModifier implements AttributeModifier<NavigationAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: PatternLockAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: PluginComponentAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: RadioAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: RatingAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: RowAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: SliderAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: StackAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: TabsAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: TextAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: WebAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mAccessibilityGroup: boolean = true

  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.accessibilityGroup(this.mAccessibilityGroup)
  }
}

@Entry
@Component
struct accessibilityGroupTestDropPage {
  @StoragePropRef('_zIndexButtonModifier') accessibilityGroupButtton: SetValue = {
    accessibilityGroup:false
  }
  @State _accessibilityGroupAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _accessibilityGroupBadgeMod: BadgeModifier = new BadgeModifier()
  @State _accessibilityGroupBlankMod: BlankModifier = new BlankModifier()
  @State _accessibilityGroupButttonMod: ButtonModifier = new ButtonModifier()
  @State _accessibilityGroupCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _accessibilityGroupCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _accessibilityGroupCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _accessibilityGroupColumnMod: ColumnModifier = new ColumnModifier()
  @State _accessibilityGroupColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _accessibilityGroupCounterMod: CounterModifier = new CounterModifier()
  @State _accessibilityGroupDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _accessibilityGroupDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _accessibilityGroupDividerMod: DividerModifier = new DividerModifier()
  @State _accessibilityGroupEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _accessibilityGroupFlexMod: FlexModifier = new FlexModifier()
  @State _accessibilityGroupFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _accessibilityGroupFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _accessibilityGroupFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _accessibilityGroupGaugeMod: GaugeModifier = new GaugeModifier()
  @State _accessibilityGroupGridMod: GridModifier = new GridModifier()
  @State _accessibilityGroupGridColMod: GridColModifier = new GridColModifier()
  @State _accessibilityGroupGridItemMod: GridItemModifier = new GridItemModifier()
  @State _accessibilityGroupGridRowMod: GridRowModifier = new GridRowModifier()
  @State _accessibilityGroupHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _accessibilityGroupImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _accessibilityGroupImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _accessibilityGroupImageMod: ImageModifier = new ImageModifier()
  @State _accessibilityGroupListMod: ListModifier = new ListModifier()
  @State _accessibilityGroupListItemMod: ListItemModifier = new ListItemModifier()
  @State _accessibilityGroupListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _accessibilityGroupLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _accessibilityGroupMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _accessibilityGroupMenuMod: MenuModifier = new MenuModifier()
  @State _accessibilityGroupMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _accessibilityGroupMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _accessibilityGroupNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _accessibilityGroupNavRouterMod: NavRouterModifier = new NavRouterModifier()
  @State _accessibilityGroupNavigationMod: NavigationModifier = new NavigationModifier()
  @State _accessibilityGroupNavigatorMod: NavigatorModifier = new NavigatorModifier()
  @State _accessibilityGroupPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _accessibilityGroupPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _accessibilityGroupQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _accessibilityGroupRadioMod: RadioModifier = new RadioModifier()
  @State _accessibilityGroupRatingMod: RatingModifier = new RatingModifier()
  @State _accessibilityGroupRefreshMod: RefreshModifier = new RefreshModifier()
  @State _accessibilityGroupRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _accessibilityGroupRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _accessibilityGroupRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _accessibilityGroupRichTextMod: RichTextModifier = new RichTextModifier()
  @State _accessibilityGroupRowMod: RowModifier = new RowModifier()
  @State _accessibilityGroupRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _accessibilityGroupScrollMod: ScrollModifier = new ScrollModifier()
  @State _accessibilityGroupScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _accessibilityGroupSearchMod: SearchModifier = new SearchModifier()
  @State _accessibilityGroupSelectMod: SelectModifier = new SelectModifier()
  @State _accessibilityGroupSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _accessibilityGroupSliderMod: SliderModifier = new SliderModifier()
  @State _accessibilityGroupStackMod: StackModifier = new StackModifier()
  @State _accessibilityGroupSwiperMod: SwiperModifier = new SwiperModifier()
  @State _accessibilityGroupTabContentMod: TabContentModifier = new TabContentModifier()
  @State _accessibilityGroupTabsMod: TabsModifier = new TabsModifier()
  @State _accessibilityGroupTextMod: TextModifier = new TextModifier()
  @State _accessibilityGroupTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _accessibilityGroupTextClockMod: TextClockModifier = new TextClockModifier()
  @State _accessibilityGroupTextInputMod: TextInputModifier = new TextInputModifier()
  @State _accessibilityGroupTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _accessibilityGroupTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _accessibilityGroupTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _accessibilityGroupToggleMod: ToggleModifier = new ToggleModifier()
  @State _accessibilityGroupUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _accessibilityGroupWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _accessibilityGroupWebMod: WebModifier = new WebModifier()
  @State _accessibilityGroupXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = ''
  @State componentKey: string = ''
  @State parentWidth: number = 0
  @State parentHeight: number =  0
  @State columns: number =  0
  @State gutter: number =  0
  @State parentComponentKey: string = ''
  @State isShow: boolean = false
  pathStack:NavPathStack = new NavPathStack()
  

  @Builder
  PanelBuilder() {
    Text('Panel')
  }

  onPageShow() {
    console.log('aboutToAppear routerParamOptions before' + this.targetView)
    const viewElement = JSON.parseJsonElement(JSON.stringify(this.getUIContext().getRouter().getParams()))
      .getElement("view")
    this.targetView = viewElement.getString("targetView")
    this.componentKey = viewElement.getString("componentKey")
    this.parentWidth = viewElement.getDouble("parentWidth")
    this.parentHeight = viewElement.getDouble("parentHeight")
    this.columns = viewElement.getDouble("columns")
    this.gutter = viewElement.getDouble("gutter")
    this.parentComponentKey = viewElement.getString("parentComponentKey")
    console.log('aboutToAppear routerParamOptions success' + this.targetView)
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.accessibilityGroup))
      this._accessibilityGroupAlphabetIndexerMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupBadgeMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupBlankMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupButttonMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupCalendarPickerMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupCheckboxMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupCheckboxGroupMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupColumnMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupColumnSplitMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupCounterMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupDataPanelMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupDatePickerMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupDividerMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupEffectComponentMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupFlexMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupFlowItemMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupFormComponentMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupFormLinkMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupGaugeMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupGridMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupGridColMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupGridItemMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupGridRowMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupHyperlinkMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupImageAnimatorMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupImageSpanMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupImageMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupListMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupListItemMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupListItemGroupMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupLoadingProgressMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupMarqueeMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupMenuMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupMenuItemMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupMenuItemGroupMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupNavDestinationMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupNavRouterMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupNavigationMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupNavigatorMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupPatternLockMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupPluginComponentMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupQRCodeMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupRadioMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupRatingMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupRefreshMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupRelativeContainerMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupRemoteWindowMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupRichEditorMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupRichTextMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupRowMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupRowSplitMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupScrollMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupScrollBarMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupSearchMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupSelectMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupSideBarContainerMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupSliderMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupStackMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupSwiperMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupTabContentMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupTabsMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupTextMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupTextAreaMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupTextClockMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupTextInputMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupTextPickerMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupTextTimerMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupTimePickerMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupToggleMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupUIExtensionComponentMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupWaterFlowMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupWebMod.mAccessibilityGroup = value.accessibilityGroup
      this._accessibilityGroupXComponentMod.mAccessibilityGroup = value.accessibilityGroup

    })
  }

  
  
  
  
  
  
  
  

  fancy(instance: CommonMethod) {
    instance.accessibilityGroup(true);
    instance.accessibilityLevel("yes");
    instance.accessibilityText("分组")
    instance.height('100%');
    instance.key(this.componentKey)
  }

  build() {
    Row() {
      if (this.targetView == 'Button') {
        Button('button1')
          .applyStyles(this.fancy)
          .attributeModifier(this._accessibilityGroupButttonMod)
      } else if (this.targetView == 'Text') {
        Text('text1')
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupTextMod)
      } else if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })

          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupAlphabetIndexerMod)
      } else if (this.targetView == 'Blank') {
        Blank().backgroundColor(Color.Yellow)
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupBlankMod)
      } else if (this.targetView == 'Checkbox') {
        Checkbox()
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupCheckboxMod)
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupCheckboxGroupMod)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })

          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupDataPanelMod)
      } else if (this.targetView == 'DatePicker') {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
        })
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupDatePickerMod)
      } else if (this.targetView == 'Divider') {
        Divider()
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupDividerMod)
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })

          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupGaugeMod)
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupImageMod)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([
            {
              src: $r('app.media.icon')
            }
          ])
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupImageAnimatorMod)
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupLoadingProgressMod)
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: 1,
          fromStart: true,
          src: 'Running Marquee starts rolling'
        })
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupMarqueeMod)
      } else if (this.targetView == 'Navigation') {
        Navigation() {
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupNavigationMod)
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }.backgroundColor(Color.Yellow)
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupMenuMod)
      } else if (this.targetView == 'NavRouter') {
        Navigation(this.pathStack) {
          Row() {
            Image($r('app.media.icon'))
          }
          NavDestination() {
            Text('NavDestination').fontSize(10)
          }
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupNavRouterMod)
      } else if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .applyStyles(this.fancy)

      } else if (this.targetView == 'QRCode') {
        QRCode('Running Marquee starts rolling')
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupQRCodeMod)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupRadioMod)
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5, indicator: false })
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupRatingMod)
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
          Text()
            .width(20)
            .height(100)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupScrollBarMod)
      } else if (this.targetView == 'Search') {
        Search()
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupSearchMod)
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' },
          { value: 'bbb' }])
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupSelectMod)
      } else if (this.targetView == 'Slider') {
        Slider({
          value: 50,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .showTips(true)

          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupSliderMod)
      } else if (this.targetView == 'TextArea') {
        TextArea({
          placeholder: 'The text area can hold an unlimited amount of text. input your word...'
        })
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupTextAreaMod)
      } else if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')

          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupTextClockMod)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .applyStyles(this.fancy)

      } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .format('mm:ss.SS')
          .fontColor(Color.Black)

          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupTextTimerMod)
      } else if (this.targetView == 'TimePicker') {
        TimePicker({
          selected: new Date('2022-07-22T08:00:00'),
        })
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupTimePickerMod)
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false })

          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupToggleMod)
      } else if (this.targetView == 'Web') {
        
        
        
      } else if (this.targetView == 'Circle') {
        Circle()
          .applyStyles(this.fancy)

      } else if (this.targetView == 'Ellipse') {
        Ellipse()
          .applyStyles(this.fancy)

      } else if (this.targetView == 'Line') {
        Line()

          .applyStyles(this.fancy)

          .startPoint([0, 0])
          .endPoint([50, 100])
          .backgroundColor(Color.Black)
      } else if (this.targetView == 'Polyline') {
        Polyline()
          .applyStyles(this.fancy)

      } else if (this.targetView == 'Polygon') {
        Polygon()
          .applyStyles(this.fancy)

      } else if (this.targetView == 'Path') {
        Path()
          .applyStyles(this.fancy)

      } else if (this.targetView == 'Rect') {
        Rect()
          .applyStyles(this.fancy)

      } else if (this.targetView == 'Shape') {
        Shape() {
          Rect().width(100).height(50)
        }
        .applyStyles(this.fancy)

      } else if (this.targetView == 'Badge') {
        Badge({
          count: 50,
          style: {
            color: 0xFFFFFF,
            fontSize: 16,
            badgeSize: 20,
            badgeColor: Color.Red
          }
        } as BadgeParamWithNumber) {
          Button('message')
            .width(100).height(50).backgroundColor(0x317aff)
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupBadgeMod)
      } else if (this.targetView == 'Column') {
        Column() {
          Column().width('100%').height(30).backgroundColor(0xAFEEEE)
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupColumnMod)
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupColumnSplitMod)
      } else if (this.targetView == 'Counter') {
        Counter() {
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupCounterMod)
      } else if (this.targetView == 'Flex') {
        Flex() {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupFlexMod)
      } else if (this.targetView == 'GridRow') {
        GridRow({
          columns: 1,
          direction: GridRowDirection.Row
        }) {
          ForEach(new Array<Color>(Color.Red, Color.Orange, Color.Yellow, Color.Green,
            Color.Pink, Color.Grey, Color.Blue, Color.Brown), (color: Color) => {
            GridCol({
              span: {
                xs: 1,
                sm: 2,
                md: 3,
                lg: 4
              }
            }) {
              Row().width('100%').height('20vp')
            }.borderColor(color).borderWidth(2)
          })
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupGridRowMod)
      } else if (this.targetView == 'Grid') {
        Grid() {
          ForEach(new Array<string>('0', '1', '2', '3', '4'), (i: string) => {
            ForEach(new Array<string>('0', '1', '2', '3', '4'), (day: string) => {
              GridItem() {
                Text(day).backgroundColor(Color.White)
                  .width('100%').height('100%').textAlign(TextAlign.Center)
              }
            })
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')

        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupGridMod)
        .backgroundColor(0xFAEEE0)
      } else if (this.targetView == 'List') {
        List() {
        }
        .applyStyles(this.fancy)
        .height('100%').width('100%')

        .attributeModifier(this._accessibilityGroupListMod)
      } else if (this.targetView == 'ListItem') {
        List({ space: 20, initialIndex: 0 }) {
          ListItem() {
            Text('item1')
              .width('100%')
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.White)
          }
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupListItemMod)
        }
        .width('100%')
        .height('100%')
      } else if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup()
            .backgroundColor(Color.Yellow)

            .applyStyles(this.fancy)

            .attributeModifier(this._accessibilityGroupListItemGroupMod)
        }.backgroundColor(Color.Pink)
        .width('100%')
        .height('100%')
      } else if (this.targetView == 'Navigator') {
        Navigation() {
          Text('Go to back page').width('100%').height(20)
        }
        .applyStyles(this.fancy)
        .backgroundColor(Color.Red)
        .attributeModifier(this._accessibilityGroupNavigatorMod)
      } else if (this.targetView == 'Panel') {
        Column() {
          Text('Text')
        }
        .bindSheet(this.isShow, this.PanelBuilder)
        .backgroundColor(Color.Yellow)
        .applyStyles(this.fancy)
        .attributeModifier(this._accessibilityGroupColumnMod)
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: true }) {
          Text('123')
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupRefreshMod)
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
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupRelativeContainerMod)
      } else if (this.targetView == 'Row') {
        Row()
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupRowMod)
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('Text')
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupRowSplitMod)
      } else if (this.targetView == 'Scroll') {
        Scroll() {
          Column() {
            ForEach(new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), (item: number) => {
              Text('Scroll' + String(item))
                .width('90%')
                .height(50)
                .backgroundColor(Color.White)
                .textAlign(TextAlign.Center)
            }, (item: number) => String(item))
          }.width('100%')
        }.scrollBar(BarState.On)
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupScrollMod)
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach(new Array<number>(1, 2, 3), (item: number) => {
              Column({ space: 5 } as ColumnOptions) {
                Image($r('app.media.icon')).width(50).height(50)
                Text('Index0' + item).fontSize(25)
              }
            })
          }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

          Column() {
            Text('SideBarContainer content').fontSize(25)
          }.backgroundColor(Color.Orange)
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupSideBarContainerMod)
      } else if (this.targetView == 'Stack') {
        Stack() {
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupStackMod)
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach(new Array<number>(1, 2, 3), (item: number) => {
            Text('Swiper' + item).width('90%').height(50)
          }, (item: number) => String(item))
        }
        .indicator(true)
        .backgroundColor(Color.White)

        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupSwiperMod)
      } else if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          }
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupTabsMod)
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
          }.tabBar('Tabs1')
          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupTabContentMod)
        }.width('100%').height('100%')
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow() {
          ForEach(new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9), (item: number) => {
            FlowItem() {
              Column() {
                Text('WaterFlow' + item).fontSize(12).height('16')
                Image($r('app.media.icon'))
                  .width(50)
                  .height(50)
                  .objectFit(ImageFit.Fill)
              }
            }
          }, (item: number) => String(item))
        }
        .applyStyles(this.fancy)

        .attributeModifier(this._accessibilityGroupWaterFlowMod)
      } else if (this.targetView == 'GridCol') {
        GridRow({
          columns: 1,
          direction: GridRowDirection.Row
        }) {
          GridCol() {
            Row().width('100%').height('20vp')
          }

          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupGridColMod)
          .backgroundColor(Color.Yellow)
        }
        .backgroundColor(Color.Pink)
        .width('100%')
        .height('100%')
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          ForEach(new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9), (item: number) => {
            FlowItem() {
              Column() {
                Text('WaterFlow' + item).fontSize(12).height('16')
                Image($r('app.media.icon'))
                  .width(50)
                  .height(50)
                  .objectFit(ImageFit.Fill)
              }
            }

            .applyStyles(this.fancy)

            .attributeModifier(this._accessibilityGroupFlowItemMod)
            .backgroundColor(Color.Yellow)
          }, (item: number) => String(item))
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
          }
          .rowStart(1)
          .rowEnd(4)

          .applyStyles(this.fancy)

          .attributeModifier(this._accessibilityGroupGridItemMod)
          .backgroundColor(Color.Yellow)
        }
        .backgroundColor(Color.Pink)
        .width('100%')
        .height('100%')
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)

              .applyStyles(this.fancy)

              .attributeModifier(this._accessibilityGroupMenuItemMod)
          }.backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }.width('100%').height('100%').backgroundColor(Color.Green)
      } else if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            }

            .applyStyles(this.fancy)

            .attributeModifier(this._accessibilityGroupMenuItemGroupMod)
          }.backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }.width('100%').height('100%').backgroundColor(Color.Green)
      }
    }
    .width(this.parentWidth)
    .height(this.parentHeight)
    .backgroundColor(Color.Pink)
    .key(this.parentComponentKey)

  }
}