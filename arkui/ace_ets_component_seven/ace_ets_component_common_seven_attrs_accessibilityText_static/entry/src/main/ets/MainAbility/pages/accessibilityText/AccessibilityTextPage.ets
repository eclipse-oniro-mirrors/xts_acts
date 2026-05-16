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
import { RouterParams, SetV } from '../../common/Utils';
import webview from '@ohos.web.webview';
import router from '@ohos.router'
import {
  DataReloadOperation,
  Flex,
  GridRow,
  Grid,
  List,
  Polyline,
  Badge,
  GridRowDirection,
  GridCol,
  GridItem,
  ListItem,
  ListItemGroup,
  DataOperationType,
  Ellipse,
  Line,
  Polygon,
  Path,
  Rect,
  Shape,
  Shape,
  ColumnSplit,
  Counter,
  Refresh,
  RelativeContainer,
  AlignRuleOption,
  Entry,
  Select,
  Select,
  TextArea,
  TextClock,
  TextInput,
  TextPicker,
  Toggle,
  Web,
  Circle,
  Text,
  ImageAnimator,
  ImageAnimator,
  Marquee,
  Navigation,
  Menu,
  Radio,
  Rating,
  ScrollBar,
  ImageFit,
  MenuItemGroup,
  TextAttribute,
  Blank,
  Checkbox,
  CheckboxGroup,
  CheckboxGroup,
  DataPanel,
  DatePicker,
  Divider,
  Gauge,
  $r,
  UIExtensionComponentAttribute,
  PatternLockAttribute,
  PluginComponentAttribute,
  FormComponentAttribute,
  ImageSpanAttribute,
  EffectComponentAttribute,
  CalendarPicker,
  Column,
  SliderAttribute,
  WaterFlowAttribute,
  WebAttribute,
  RowSplit,
  Scroll,
  SideBarContainer,
  Swiper,
  Tabs,
  Canvas,
  RenderingContextSettings,
  Component,
  VideoAttribute,
  VideoAttribute,
  VideoAttribute,
  WindowSceneAttribute,
  XComponentAttribute,
  CanvasRenderingContext2D,
  Stack,
  TextClockAttribute,
  TextInputAttribute,
  TextPickerAttribute,
  TextTimerAttribute,
  TimePickerAttribute,
  ToggleAttribute,
  WaterFlow,
  SpanAttribute,
  StackAttribute,
  SwiperAttribute,
  TabContentAttribute,
  TabsAttribute,
  LazyForEach,
  ScrollBarAttribute,
  SearchAttribute,
  SelectAttribute,
  ShapeAttribute,
  SideBarContainerAttribute,
  SideBarContainerAttribute,
  FlowItem,
  RefreshAttribute,
  RelativeContainerAttribute,
  RemoteWindowAttribute,
  RichEditorAttribute,
  RichTextAttribute,
  TextAreaAttribute,
  DataOperation,
  ProgressAttribute,
  QRCodeAttribute,
  RadioAttribute,
  RatingAttribute,
  RectAttribute,
  RowAttribute,
  RowSplitAttribute,
  Color,
  FormLink,
  Hyperlink,
  Span,
  LoadingProgress,
  MenuItem,
  Progress,
  QRCode,
  BarState,
  Slider,
  Builder,
  PathAttribute,
  PolygonAttribute,
  PolylineAttribute,
  ScrollAttribute,
  TextTimer,
  TimePicker,
  ToggleType,
  TextAlign,
  MenuAttribute,
  MenuItemAttribute,
  MenuItemGroupAttribute,
  NavDestinationAttribute,
  NavigationAttribute,
  DataChangeListener,
  ListItemAttribute,
  ListItemGroupAttribute,
  LoadingProgressAttribute,
  MarqueeAttribute,
  IDataSource,
  HyperlinkAttribute,
  ImageAttribute,
  ImageAnimatorAttribute,
  LineAttribute,
  ListAttribute,
  Button,
  GridAttribute,
  GridColAttribute,
  GridItemAttribute,
  GridRowAttribute,
  VerticalAlign,
  HorizontalAlign,
  ButtonAttribute,
  FlowItemAttribute,
  FormLinkAttribute,
  GaugeAttribute,
  SideBarContainerType,
  ClickEvent,
  DividerAttribute,
  EllipseAttribute,
  FlexAttribute,
  CounterAttribute,
  DataPanelAttribute,
  DatePickerAttribute,
  Image,
  CircleAttribute,
  ColumnAttribute,
  ColumnSplitAttribute,
  Search,
  CanvasAttribute,
  CheckboxAttribute,
  CheckboxGroupAttribute,
  Row,
  BadgeAttribute,
  BlankAttribute,
  CalendarPickerAttribute,
  TabContent,
  Column,
  AttributeModifier,
  AlphabetIndexerAttribute,
  ColumnOptions,
  SearchController,
  ComponentV2,
  ForEach,
  AlphabetIndexer,
  FlexAlign,
  ColumnOptions,
  WaterFlowSections,
  Scroller,
  SectionOptions,
  MenuItemOptions,
  Navigation,
  NavPathStack,
  NavDestination,
  ProgressType,
  SliderStyle,
  BadgeParamWithNumber,
  CommonMethod,
  applyStyles,
  AlignRuleOption
} from '@ohos.arkui.component'
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

import { attrsManager } from '../../common/AttrsManager';
import router from '@ohos.router'
import udmfType from '@ohos.data.uniformTypeDescriptor';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: BlankAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: CounterAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: DividerAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: EffectComponentAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: FlexAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: FormComponentAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: GridAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: GridColAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ImageSpanAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ListAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: MenuAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: PatternLockAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: PluginComponentAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: RadioAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: RatingAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: RowAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: SliderAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class StackModifier implements AttributeModifier<StackAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: StackAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: TabsAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: TextAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: WebAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mAccessibilityText: string = ''

  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.accessibilityText(this.mAccessibilityText)
  }
}

@Entry
@Component
struct accessibilityTextTestDropPage {
  @StoragePropRef('_zIndexButtonModifier') _accessibilityTextButtton: SetV = {
    accessibilityText:''
  }
  @State _accessibilityTextAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _accessibilityTextBadgeMod: BadgeModifier = new BadgeModifier()
  @State _accessibilityTextBlankMod: BlankModifier = new BlankModifier()
  @State _accessibilityTextButttonMod: ButtonModifier = new ButtonModifier()
  @State _accessibilityTextCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _accessibilityTextCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _accessibilityTextCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _accessibilityTextColumnMod: ColumnModifier = new ColumnModifier()
  @State _accessibilityTextColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _accessibilityTextCounterMod: CounterModifier = new CounterModifier()
  @State _accessibilityTextDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _accessibilityTextDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _accessibilityTextDividerMod: DividerModifier = new DividerModifier()
  @State _accessibilityTextEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _accessibilityTextFlexMod: FlexModifier = new FlexModifier()
  @State _accessibilityTextFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _accessibilityTextFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _accessibilityTextFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _accessibilityTextGaugeMod: GaugeModifier = new GaugeModifier()
  @State _accessibilityTextGridMod: GridModifier = new GridModifier()
  @State _accessibilityTextGridColMod: GridColModifier = new GridColModifier()
  @State _accessibilityTextGridItemMod: GridItemModifier = new GridItemModifier()
  @State _accessibilityTextGridRowMod: GridRowModifier = new GridRowModifier()
  @State _accessibilityTextHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _accessibilityTextImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _accessibilityTextImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _accessibilityTextImageMod: ImageModifier = new ImageModifier()
  @State _accessibilityTextListMod: ListModifier = new ListModifier()
  @State _accessibilityTextListItemMod: ListItemModifier = new ListItemModifier()
  @State _accessibilityTextListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _accessibilityTextLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _accessibilityTextMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _accessibilityTextMenuMod: MenuModifier = new MenuModifier()
  @State _accessibilityTextMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _accessibilityTextMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _accessibilityTextNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  @State _accessibilityTextNavRouterMod: NavigationModifier = new NavigationModifier()
  @State _accessibilityTextNavigationMod: NavigationModifier = new NavigationModifier()
  @State _accessibilityTextNavigatorMod: NavigationModifier = new NavigationModifier()
  @State _accessibilityTextPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _accessibilityTextPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _accessibilityTextQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _accessibilityTextRadioMod: RadioModifier = new RadioModifier()
  @State _accessibilityTextRatingMod: RatingModifier = new RatingModifier()
  @State _accessibilityTextRefreshMod: RefreshModifier = new RefreshModifier()
  @State _accessibilityTextRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _accessibilityTextRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _accessibilityTextRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _accessibilityTextRichTextMod: RichTextModifier = new RichTextModifier()
  @State _accessibilityTextRowMod: RowModifier = new RowModifier()
  @State _accessibilityTextRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _accessibilityTextScrollMod: ScrollModifier = new ScrollModifier()
  @State _accessibilityTextScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _accessibilityTextSearchMod: SearchModifier = new SearchModifier()
  @State _accessibilityTextSelectMod: SelectModifier = new SelectModifier()
  @State _accessibilityTextSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _accessibilityTextSliderMod: SliderModifier = new SliderModifier()
  @State _accessibilityTextStackMod: StackModifier = new StackModifier()
  @State _accessibilityTextSwiperMod: SwiperModifier = new SwiperModifier()
  @State _accessibilityTextTabContentMod: TabContentModifier = new TabContentModifier()
  @State _accessibilityTextTabsMod: TabsModifier = new TabsModifier()
  @State _accessibilityTextTextMod: TextModifier = new TextModifier()
  @State _accessibilityTextTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _accessibilityTextTextClockMod: TextClockModifier = new TextClockModifier()
  @State _accessibilityTextTextInputMod: TextInputModifier = new TextInputModifier()
  @State _accessibilityTextTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _accessibilityTextTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _accessibilityTextTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _accessibilityTextToggleMod: ToggleModifier = new ToggleModifier()
  @State _accessibilityTextUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _accessibilityTextWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _accessibilityTextWebMod: WebModifier = new WebModifier()
  @State _accessibilityTextXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = ''
  @State componentKey: string =  ''
  @State parentWidth: number = 0
  @State parentHeight: number = 0
  @State columns: number =  0
  @State gutter: number =  0
  @State parentComponentKey: string = ''
  @State isShow:boolean = false
  pathStack: NavPathStack = new NavPathStack()
  //controller: webview.WebviewController = new webview.WebviewController();

  @Builder PanelBuilder(){
    Text('Panel')
  }

  onPageShow() {
    console.log('aboutToAppear routerParamOptions before' + this.targetView)
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    this.targetView = routerParamOptions.view.targetView
    this.componentKey = routerParamOptions.view.componentKey as string
    this.parentWidth = routerParamOptions.view.parentWidth
    this.parentHeight = routerParamOptions.view.parentHeight
    this.columns = routerParamOptions.view.columns
    this.gutter = routerParamOptions.view.gutter
    this.parentComponentKey = routerParamOptions.view.parentComponentKey
    console.log('aboutToAppear routerParamOptions success' + this.targetView)
    attrsManager.registerDataChange((value:SetV) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.accessibilityText))
      this._accessibilityTextAlphabetIndexerMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextBadgeMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextBlankMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextButttonMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextCalendarPickerMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextCheckboxMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextCheckboxGroupMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextColumnMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextColumnSplitMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextCounterMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextDataPanelMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextDatePickerMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextDividerMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextEffectComponentMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextFlexMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextFlowItemMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextFormComponentMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextFormLinkMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextGaugeMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextGridMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextGridColMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextGridItemMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextGridRowMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextHyperlinkMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextImageAnimatorMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextImageSpanMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextImageMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextListMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextListItemMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextListItemGroupMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextLoadingProgressMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextMarqueeMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextMenuMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextMenuItemMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextMenuItemGroupMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextNavDestinationMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextNavRouterMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextNavigationMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextNavigatorMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextPatternLockMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextPluginComponentMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextQRCodeMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextRadioMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextRatingMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextRefreshMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextRelativeContainerMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextRemoteWindowMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextRichEditorMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextRichTextMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextRowMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextRowSplitMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextScrollMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextScrollBarMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextSearchMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextSelectMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextSideBarContainerMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextSliderMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextStackMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextSwiperMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextTabContentMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextTabsMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextTextMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextTextAreaMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextTextClockMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextTextInputMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextTextPickerMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextTextTimerMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextTimePickerMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextToggleMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextUIExtensionComponentMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextWaterFlowMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextWebMod.mAccessibilityText = value.accessibilityText
      this._accessibilityTextXComponentMod.mAccessibilityText = value.accessibilityText

    })
  }

  // @Styles commonStyle(){
  //   .accessibilityGroup(true)
  //   .accessibilityLevel("yes")
  //   .accessibilityText("分组")
  //   .height('100%')
  //   .gridSpan(1)
  //   .key(this.componentKey)
  // }

  fancy(instance: CommonMethod) {
    instance.accessibilityGroup(true);
    instance.accessibilityLevel("yes");
    instance.accessibilityText("分组")
    instance.height('100%');
    instance.key(this.componentKey)
  }

  build() {
    GridCol({ span: this.columns.toInt(), offset: this.gutter.toInt(), order: 0 }) {
    Row() {
      if (this.targetView == 'Button') {
        Button('button1')
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextButttonMod)
      } else if (this.targetView == 'Text') {
        Text('text1')
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextTextMod)
      } else if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })

          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextAlphabetIndexerMod)
      } else if (this.targetView == 'Blank') {
        Blank().backgroundColor(Color.Yellow)
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextBlankMod)
      } else if (this.targetView == 'Checkbox') {
        Checkbox()
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextCheckboxMod)
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextCheckboxGroupMod)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })

          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextDataPanelMod)
      } else if (this.targetView == 'DatePicker') {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
        })
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextDatePickerMod)
      } else if (this.targetView == 'Divider') {
        Divider()
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextDividerMod)
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })

          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextGaugeMod)
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextImageMod)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([
            {
              src: $r('app.media.icon')
            }
          ])
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextImageAnimatorMod)
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextLoadingProgressMod)
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: Infinity.toInt(),
          fromStart: true,
          src: 'Running Marquee starts rolling'
        })
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextMarqueeMod)
      } else if (this.targetView == 'Navigation') {
        Navigation() {
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextNavigationMod)
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }.backgroundColor(Color.Yellow)
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextMenuMod)
      } else if (this.targetView == 'NavRouter') {
        Navigation(this.pathStack) {
          Row() {
            Image($r('app.media.icon'))
          }

          NavDestination() {
            Text('NavDestination').fontSize(10)
          }
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextNavRouterMod)
      } else if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .applyStyles(this.fancy)
      } else if (this.targetView == 'QRCode') {
        QRCode('Running Marquee starts rolling')
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextQRCodeMod)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextRadioMod)
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5, indicator: false })
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextRatingMod)
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
          Text()
            .width(20)
            .height(100)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextScrollBarMod)
      } else if (this.targetView == 'Search') {
        Search()
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextSearchMod)
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' },
          { value: 'bbb' }])
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextSelectMod)
      } else if (this.targetView == 'Slider') {
        Slider({
          value: 50,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .showTips(true)

          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextSliderMod)
      } else if (this.targetView == 'TextArea') {
        TextArea({
          placeholder: 'The text area can hold an unlimited amount of text. input your word...'
        })
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextTextAreaMod)
      } else if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')

          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextTextClockMod)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
.applyStyles(this.fancy)
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .format('mm:ss.SS')
          .fontColor(Color.Black)

          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextTextTimerMod)
      } else if (this.targetView == 'TimePicker') {
        TimePicker({
          selected: new Date('2022-07-22T08:00:00'),
        })
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextTimePickerMod)
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextToggleMod)
      } else if (this.targetView == 'Web') {
        // Web({ src: 'www.example.com', controller: this.controller }).applyStyles(this.fancy)
        // .attributeModifier(this._accessibilityTextWebMod)
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
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextBadgeMod)
      } else if (this.targetView == 'Column') {
        Column() {
          Column().width('100%').height(30).backgroundColor(0xAFEEEE)
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextColumnMod)
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextColumnSplitMod)
      } else if (this.targetView == 'Counter') {
        Counter() {
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextCounterMod)
      } else if (this.targetView == 'Flex') {
        Flex() {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextFlexMod)
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
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextGridRowMod)
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
        .attributeModifier(this._accessibilityTextGridMod)
        .backgroundColor(0xFAEEE0)
      } else if (this.targetView == 'List') {
        List() {
        }.height('100%').width('100%')

.applyStyles(this.fancy).attributeModifier(this._accessibilityTextListMod)
      } else if (this.targetView == 'ListItem') {
        List({ space: 20, initialIndex: 0 }) {
          ListItem() {
            Text('item1')
              .width('100%')
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.White)
          }
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextListItemMod)
        }
        .width('100%')
        .height('100%')
      } else if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup()
            .backgroundColor(Color.Yellow)

            .applyStyles(this.fancy).attributeModifier(this._accessibilityTextListItemGroupMod)
        }.backgroundColor(Color.Pink)
        .width('100%')
        .height('100%')
      } else if (this.targetView == 'Navigator') {
        Navigation() {
          Text('Go to back page').width('100%').height(20)
        }
        .applyStyles(this.fancy).backgroundColor(Color.Red).attributeModifier(this._accessibilityTextNavigatorMod)
      } else if (this.targetView == 'Panel') {
        Column(){
            Text('Text')
        }
        .backgroundColor(Color.Yellow).applyStyles(this.fancy).bindSheet(this.isShow,this.PanelBuilder)
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: true }) {
          Text('123')
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextRefreshMod)
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer() {
          Row()
            .width(100)
            .height(100)
            .backgroundColor('#FF3333')
            .alignRules({
                top: { anchor: '__container__', align: VerticalAlign.Top },
                left: { anchor: '__container__', align: HorizontalAlign.Start }
            } as AlignRuleOption)
            .id('constraintSize')
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextRelativeContainerMod)
      } else if (this.targetView == 'Row') {
        Row()
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextRowMod)
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('Text')
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextRowSplitMod)
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
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextScrollMod)
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
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextSideBarContainerMod)
      } else if (this.targetView == 'Stack') {
        Stack() {
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextStackMod)
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach(new Array<number>(1, 2, 3), (item: number) => {
            Text('Swiper' + item).width('90%').height(50)
          }, (item: number) => String(item))
        }
        .indicator(true)
        .backgroundColor(Color.White)

        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextSwiperMod)
      } else if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          }
        }
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextTabsMod)
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
          }.tabBar('Tabs1')
          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextTabContentMod)
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
        .applyStyles(this.fancy).attributeModifier(this._accessibilityTextWaterFlowMod)
      } else if (this.targetView == 'GridCol') {
        GridRow({
          columns: 1,
          direction: GridRowDirection.Row
        }) {
          GridCol() {
            Row().width('100%').height('20vp')
          }

          .applyStyles(this.fancy).attributeModifier(this._accessibilityTextGridColMod)
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

            .applyStyles(this.fancy).attributeModifier(this._accessibilityTextFlowItemMod)
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
          .attributeModifier(this._accessibilityTextGridItemMod)
          .backgroundColor(Color.Yellow)
        }
        .backgroundColor(Color.Pink)
        .width('100%')
        .height('100%')
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)

              .applyStyles(this.fancy).attributeModifier(this._accessibilityTextMenuItemMod)
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

            .applyStyles(this.fancy).attributeModifier(this._accessibilityTextMenuItemGroupMod)
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