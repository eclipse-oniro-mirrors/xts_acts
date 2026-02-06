'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import { RouterParams } from '../../common/Utils';
import {
  DataReloadOperation,Flex,GridRow,Grid,List,Polyline,Badge,GridRowDirection,GridCol,GridItem,ListItem,ListItemGroup,DataOperationType,Ellipse,Line,Polygon,Path,Rect,Shape,Shape,ColumnSplit,Counter,Refresh,RelativeContainer,AlignRuleOption,Entry,Select,Select,TextArea,TextClock,TextInput,TextPicker,
  Toggle,
  Web,Circle,Text,ImageAnimator,ImageAnimator,Marquee,Navigation,Menu,Radio,Rating,ScrollBar,ImageFit,MenuItemGroup,TextAttribute,Blank,Checkbox,CheckboxGroup,CheckboxGroup,DataPanel,DatePicker,Divider,Gauge,
  $r,WebviewController,
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
  applyStyles
} from '@ohos.arkui.component'
import { State, Link, PropRef,StoragePropRef,AppStorage,Observed } from '@ohos.arkui.stateManagement'
import webview from '@ohos.web.webview';
import { ItemState } from '@ohos.arkui.advanced.ToolBar'
import { RecordData } from '@ohos.base';


let navPathStack = new NavPathStack()

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}
@Observed
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: BlankAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: CanvasAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: CheckboxAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: CircleAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: CounterAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: DividerAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: EllipseAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: FlexAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: FlowItemAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: FormLinkAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class GridModifier implements AttributeModifier<GridAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: GridAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: GridColAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: GridItemAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: HyperlinkAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class LineModifier implements AttributeModifier<LineAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: LineAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ListModifier implements AttributeModifier<ListAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ListAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: MenuAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class PanelModifier implements AttributeModifier<ColumnAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class PathModifier implements AttributeModifier<PathAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: PathAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: PolygonAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: PolylineAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ProgressAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: QRCodeAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: RadioAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: RatingAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class RectModifier implements AttributeModifier<RectAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: RectAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: RichTextAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class RowModifier implements AttributeModifier<RowAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: RowAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ScrollBarAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: SelectAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ShapeAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: SliderAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}


class StackModifier implements AttributeModifier<StackAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: StackAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: SwiperAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: TabsAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class TextModifier implements AttributeModifier<TextAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: TextAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: VideoAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class WebModifier implements AttributeModifier<WebAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: WebAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: WindowSceneAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mZIndex: int = 7

  applyNormalAttribute(instance: XComponentAttribute): void {
    instance.zIndex(this.mZIndex)
  }
}

@Entry
@Component
struct ZIndexPage {
  @State _zIndexAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _zIndexBadgeModifier: BadgeModifier = new BadgeModifier()
  @State _zIndexButtonModifier: ButtonModifier = new ButtonModifier()
  @State _zIndexBlankModifier: BlankModifier = new BlankModifier()
  @State _zIndexCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
  @State _zIndexCanvasModifier: CanvasModifier = new CanvasModifier()
  @State _zIndexCheckboxModifier: CheckboxModifier = new CheckboxModifier()
  @State _zIndexCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _zIndexCircleModifier: CircleModifier = new CircleModifier()
  @State _zIndexColumnModifier: ColumnModifier = new ColumnModifier()
  @State _zIndexColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
  @State _zIndexCounterModifier: CounterModifier = new CounterModifier()
  @State _zIndexDataPanelModifier: DataPanelModifier = new DataPanelModifier()
  @State _zIndexDatePickerModifier: DatePickerModifier = new DatePickerModifier()
  @State _zIndexDividerModifier: DividerModifier = new DividerModifier()
  @State _zIndexEllipseModifier: EllipseModifier = new EllipseModifier()
  @State _zIndexFlexModifier: FlexModifier = new FlexModifier()
  @State _zIndexFlowItemModifier: FlowItemModifier = new FlowItemModifier()
  @State _zIndexFormLinkModifier: FormLinkModifier = new FormLinkModifier()
  @State _zIndexGaugeModifier: GaugeModifier = new GaugeModifier()
  @State _zIndexGridModifier: GridModifier = new GridModifier()
  @State _zIndexGridColModifier: GridColModifier = new GridColModifier()
  @State _zIndexGridItemModifier: GridItemModifier = new GridItemModifier()
  @State _zIndexGridRowModifier: GridRowModifier = new GridRowModifier()
  @State _zIndexHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
  @State _zIndexImageModifier: ImageModifier = new ImageModifier()
  @State _zIndexImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _zIndexLineModifier: LineModifier = new LineModifier()
  @State _zIndexListModifier: ListModifier = new ListModifier()
  @State _zIndexListItemModifier: ListItemModifier = new ListItemModifier()
  @State _zIndexListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
  @State _zIndexLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
  @State _zIndexMarqueeModifier: MarqueeModifier = new MarqueeModifier()
  @State _zIndexMenuModifier: MenuModifier = new MenuModifier()
  @State _zIndexMenuItemModifier: MenuItemModifier = new MenuItemModifier()
  @State _zIndexMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _zIndexNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
  @State _zIndexNavigationModifier: NavigationModifier = new NavigationModifier()
  @State _zIndexNavigatorModifier: NavigationModifier = new NavigationModifier()
  @State _zIndexNavRouterModifier: NavigationModifier = new NavigationModifier()
  @State _zIndexPanelModifier: PanelModifier = new PanelModifier()
  @State _zIndexPathModifier: PathModifier = new PathModifier()
  @State _zIndexPolygonModifier: PolygonModifier = new PolygonModifier()
  @State _zIndexPolylineModifier: PolylineModifier = new PolylineModifier()
  @State _zIndexProgressModifier: ProgressModifier = new ProgressModifier()
  @State _zIndexQRCodeModifier: QRCodeModifier = new QRCodeModifier()
  @State _zIndexRadioModifier: RadioModifier = new RadioModifier()
  @State _zIndexRatingModifier: RatingModifier = new RatingModifier()
  @State _zIndexRectModifier: RectModifier = new RectModifier()
  @State _zIndexRefreshModifier: RefreshModifier = new RefreshModifier()
  @State _zIndexRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
  @State _zIndexRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
  @State _zIndexRichEditorModifier: RichEditorModifier = new RichEditorModifier()
  @State _zIndexRichTextModifier: RichTextModifier = new RichTextModifier()
  @State _zIndexRowModifier: RowModifier = new RowModifier()
  @State _zIndexRowSplitModifier: RowSplitModifier = new RowSplitModifier()
  @State _zIndexScrollModifier: ScrollModifier = new ScrollModifier()
  @State _zIndexScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
  @State _zIndexSearchModifier: SearchModifier = new SearchModifier()
  @State _zIndexSelectModifier: SelectModifier = new SelectModifier()
  @State _zIndexShapeModifier: ShapeModifier = new ShapeModifier()
  @State _zIndexSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
  @State _zIndexSliderModifier: SliderModifier = new SliderModifier()
  @State _zIndexStackModifier: StackModifier = new StackModifier()
  @State _zIndexSwiperModifier: SwiperModifier = new SwiperModifier()
  @State _zIndexTabContentModifier: TabContentModifier = new TabContentModifier()
  @State _zIndexTabsModifier: TabsModifier = new TabsModifier()
  @State _zIndexTextModifier: TextModifier = new TextModifier()
  @State _zIndexTextAreaModifier: TextAreaModifier = new TextAreaModifier()
  @State _zIndexTextClockModifier: TextClockModifier = new TextClockModifier()
  @State _zIndexTextInputModifier: TextInputModifier = new TextInputModifier()
  @State _zIndexTextPickerModifier: TextPickerModifier = new TextPickerModifier()
  @State _zIndexTextTimerModifier: TextTimerModifier = new TextTimerModifier()
  @State _zIndexTimePickerModifier: TimePickerModifier = new TimePickerModifier()
  @State _zIndexToggleModifier: ToggleModifier = new ToggleModifier()
  @State _zIndexVideoModifier: VideoModifier = new VideoModifier()
  @State _zIndexWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
  @State _zIndexWebModifier: WebModifier = new WebModifier()
  @State _zIndexWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
  @State _zIndexXComponentModifier: XComponentModifier = new XComponentModifier()
  @State targetView: string = ''
  @State componentKey: string = ''
  @State parentWidth: number =  0
  @State parentHeight: number =  0
  @State columns: number = 0
  @State gutter: number = 0
  @State parentBackGroundColor: string = '#FFFF00';
  @State parentComponentKey: string = ''

  @Builder
  PanelBuilder() {
    Text('Text')
  }
  private stateChangCallBack:(eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      const data = eventData.data as Record<string, RecordData>                        //��Ҫ�Ȼ�ȡ����������֮��  �ٷ��ʳ�Ա����
      if (data!['mZIndex'] != null) {
        console.log('colorBlendcolorBlendcolorBlendcolorBlendcolorBlend',data!['mZIndex']);
        this._zIndexButtonModifier.mZIndex = data!['mZIndex'] as int
        console.log('colorBlendcolorBlendcolorBlendcolorBlendcolorBlend2',this._zIndexButtonModifier.mZIndex);
      }
    }
  }
  onPageShow() {
    console.info('zIndex translate page show called ')
    try {
      console.log('aboutToAppear routerParamOptions before' + this.targetView)
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey
      this.parentWidth = routerParamOptions.view.parentWidth
      this.parentHeight = routerParamOptions.view.parentHeight
      this.columns = routerParamOptions.view.columns
      this.gutter = routerParamOptions.view.gutter
      this.parentBackGroundColor = routerParamOptions.view.parentBackGroundColor
      this.parentComponentKey = routerParamOptions.view.parentComponentKey
      let stateChangeEvent: events_emitter.InnerEvent = {
        eventId: 184,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    } catch (error) {
      console.log(' routerParamOptions error ' + error);
    }
  }

  fancy(instance: CommonMethod) {
    instance.key(this.componentKey);
  }

  build() {
    Column() {
      if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexAlphabetIndexerModifier)
      }
      if (this.targetView == 'Button') {
        Button('button1')
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexButtonModifier)
      }
      if (this.targetView == 'Blank') {
        Blank()
          .backgroundColor(Color.Yellow)
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexBlankModifier)
      }
      if (this.targetView == 'Checkbox') {
        Checkbox()
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexCheckboxModifier)
      }
      if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexCheckboxGroupModifier)
      }
      if (this.targetView == 'DataPanel') {
        DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexDataPanelModifier)
      }
      if (this.targetView == 'DatePicker') {
        DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexDatePickerModifier)
      }
      if (this.targetView == 'Divider') {
        Divider()
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexDividerModifier)
      }
      if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })
          .colors([[Color.Red, 1], [Color.Red, 1], [Color.Red, 1], [Color.Red, 1]])
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexGaugeModifier)
      }
      if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexImageModifier)
      }
      if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([{ src: $r('app.media.icon') }])
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexImageAnimatorModifier)
      }
      if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexLoadingProgressModifier)
      }
      if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: 1,
          fromStart: true,
          src: 'Running Marquee starts rolling'
        })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexMarqueeModifier)
      }
      if (this.targetView == 'Navigation') {
        Navigation({}) {
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexNavigationModifier)
      }
      if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }
        .backgroundColor(Color.Yellow)
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexMenuModifier)
      }
      if (this.targetView == 'NavRouter') {
        Navigation(navPathStack) {
          Row() {
            Image($r('app.media.icon'))
          }

          NavDestination() {
            Text('NavDestination')
              .fontSize(10)
          }
        }

        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexNavRouterModifier)
      }
      if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexProgressModifier)
      }
      if (this.targetView == 'QRCode') {
        QRCode('Running Marquee starts rolling')
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexQRCodeModifier)
      }
      if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexRadioModifier)
      }
      if (this.targetView == 'Rating') {
        Rating({ rating: 3.5, indicator: false })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexRatingModifier)
      }
      if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
          Text()
            .width(20)
            .height(100)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexScrollBarModifier)
      }
      if (this.targetView == 'Search') {
        Search()
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexSearchModifier)
      }
      if (this.targetView == 'Select') {
        Select([{ value: 'aaa' }, { value: 'bbb' }])
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexSelectModifier)
      }
      if (this.targetView == 'Slider') {
        Slider({
          value: 50,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .showTips(true)
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexSliderModifier)
      }
      if (this.targetView == 'Text') {
        Text('text1')
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexTextModifier)
      }
      if (this.targetView == 'TextArea') {
        TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexTextAreaModifier)
      }
      if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexTextClockModifier)
      }
      if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexTextInputModifier)
      }
      if (this.targetView == 'TextPicker') {
        TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexTextPickerModifier)
      }
      if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .format('mm:ss.SS')
          .fontColor(Color.Black)
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexTextTimerModifier)
      }
      if (this.targetView == 'TimePicker') {
        TimePicker({ selected: new Date('2022-07-22T08:00:00') })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexTimePickerModifier)
      }
      if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexToggleModifier)
      }
      if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexWebModifier)
      }
      if (this.targetView == 'Circle') {
        Circle()
          .width(150)
          .height(200)
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexCircleModifier)
      }
      if (this.targetView == 'Ellipse') {
        Ellipse()
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexEllipseModifier)
      }
      if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .backgroundColor(Color.Black)
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexLineModifier)
      }
      if (this.targetView == 'Polyline') {
        Polyline()
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexPolylineModifier)
      }
      if (this.targetView == 'Polygon') {
        Polygon()
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexPolygonModifier)
      }
      if (this.targetView == 'Path') {
        Path()
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexPathModifier)
      }
      if (this.targetView == 'Rect') {
        Rect()
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexRectModifier)
      }
      if (this.targetView == 'Shape') {
        Shape() {
          Rect()
            .width(100)
            .height(50)
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexShapeModifier)
      }
      if (this.targetView == 'Badge') {
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
            .width(100)
            .height(50)
            .backgroundColor(0x317aff)
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexBadgeModifier)
      }
      if (this.targetView == 'Column') {
        Column() {
          Button('')
            .width(100)
            .height(50)
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexColumnModifier)
      }
      if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1')
            .width('100%')
            .height(50)
            .backgroundColor(0xF5DEB3)
            .textAlign(TextAlign.Center)
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexColumnSplitModifier)
      }
      if (this.targetView == 'Counter') {
        Counter() {
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexCounterModifier)
      }
      if (this.targetView == 'Flex') {
        Flex() {
          Text('1')
            .width('20%')
            .height(50)
            .backgroundColor(0xF5DEB3)
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexFlexModifier)
      }
      if (this.targetView == 'GridRow') {
        GridRow({ columns: 1, direction: GridRowDirection.Row }) {
          ForEach(
            [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown],
            (color: Color) => {
              GridCol({
                span: {
                  xs: 1,
                  sm: 2,
                  md: 3,
                  lg: 4
                }
              }) {
                Row()
                  .width('100%')
                  .height('20vp')
              }
              .borderColor(color)
              .borderWidth(2)
            }
          )
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexGridRowModifier)
      }
      if (this.targetView == 'Grid') {
        Grid() {
          ForEach(['0', '1', '2', '3', '4'], () => {
            ForEach(['0', '1', '2', '3', '4'], (day: string) => {
              GridItem() {
                Text(day)
                  .backgroundColor(Color.White)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }
            })
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .backgroundColor(0xFAEEE0)
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexGridModifier)
      }
      if (this.targetView == 'List') {
        List() {
        }
        .height('100%')
        .width('100%')
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexListModifier)
      }
      if (this.targetView == 'ListItem') {
        List({ space: 20, initialIndex: 0 }) {
          ListItem() {
            Text('item1')
              .width('100%')
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.White)
          }
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexListItemModifier)
        }
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup()
            .backgroundColor(Color.Yellow)
            .applyStyles(this.fancy)
            .attributeModifier(this._zIndexListItemGroupModifier)
        }
        .backgroundColor(Color.Pink)
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'Navigator') {
        Navigation(navPathStack) {
          Text('Go to back page')
            .width('100%')
            .height(20)
        }
        .backgroundColor(Color.Red)

        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexNavigatorModifier)
      }
      if (this.targetView == 'Panel') {
        Column() {
          Text('panel')
        }
        .bindSheet(true,this.PanelBuilder)
        .backgroundColor(Color.Yellow)
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexPanelModifier)
      }
      if (this.targetView == 'Refresh') {
        Refresh({ refreshing: true }) {
          Text('123')
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexRefreshModifier)
      }
      if (this.targetView == 'RelativeContainer') {
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
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexRelativeContainerModifier)
      }
      if (this.targetView == 'Row') {
        Row()
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexRowModifier)
      }
      if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('Text')
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexRowSplitModifier)
      }
      if (this.targetView == 'Scroll') {
        Scroll() {
          Column() {
            ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[], (item: number,index:Int) => {
              Text('Scroll' + item.toString())
                .width('90%')
                .height(50)
                .backgroundColor(Color.White)
                .textAlign(TextAlign.Center)
            }, (item: number,index:Int) => item.toString())
          }
          .width('100%')
        }
        .scrollBar(BarState.On)
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexScrollModifier)
      }
      if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach([1, 2, 3] as number[], (item: number,index:Int) => {
              Column({ space: 5 } as ColumnOptions) {
                Image($r('app.media.icon'))
                  .width(50)
                  .height(50)
                Text('Index0' + item)
                  .fontSize(25)
              }
            })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
          .backgroundColor(Color.Green)

          Column() {
            Text('SideBarContainer content')
              .fontSize(25)
          }
          .backgroundColor(Color.Orange)
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexSideBarContainerModifier)
      }
      if (this.targetView == 'Stack') {
        Stack() {
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexStackModifier)
      }
      if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach([1, 2, 3] as number[], (item: number,index:Int) => {
            Text('Swiper' + item)
              .width('90%')
              .height(50)
          }, (item: number,index:Int) => item.toString())
        }
        .indicator(true)
        .backgroundColor(Color.White)
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexSwiperModifier)
      }
      if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Column()
              .width('100%')
              .height('100%')
              .backgroundColor('#00CB87')
          }
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexTabsModifier)
      }
      if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Text('TabContent Test')
              .width('100%')
              .height('100%')
              .backgroundColor(Color.White)
          }
          .tabBar('Tabs1')
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexTabContentModifier)
        }
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'WaterFlow') {
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9] as number[], (item: number,index:Int) => {
            FlowItem() {
              Column() {
                Text('WaterFlow' + item)
                  .fontSize(12)
                  .height('16')
                Image($r('app.media.icon'))
                  .width(50)
                  .height(50)
                  .objectFit(ImageFit.Fill)
              }
            }
          }, (item: number,index:Int) => item.toString())
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexWaterFlowModifier)
      }
      if (this.targetView == 'GridCol') {
        GridRow({ columns: 1, direction: GridRowDirection.Row }) {
          GridCol() {
            Row()
              .width('100%')
              .height('20vp')
          }
          .backgroundColor(Color.Yellow)
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexGridColModifier)
        }
        .backgroundColor(Color.Pink)
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'GridItem') {
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
          .backgroundColor(Color.Yellow)
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexGridItemModifier)
        }
        .backgroundColor(Color.Pink)
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'FlowItem') {
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9] as number[], (item: number,index:Int) => {
            FlowItem() {
              Column() {
                Text('WaterFlow' + item)
                  .fontSize(12)
                  .height('16')
                Image($r('app.media.icon'))
                  .width(50)
                  .height(50)
                  .objectFit(ImageFit.Fill)
              }
            }
            .backgroundColor(Color.Yellow)
            .applyStyles(this.fancy)
            .attributeModifier(this._zIndexFlowItemModifier)
          }, (item: number,index:Int) => item.toString())
        }
        .backgroundColor(Color.Pink)
        .width('100%')
        .height('100%')
      }
      if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .applyStyles(this.fancy)
              .attributeModifier(this._zIndexMenuItemModifier)
          }
          .backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Green)
      }
      if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            }
            .applyStyles(this.fancy)
            .attributeModifier(this._zIndexMenuItemGroupModifier)
          }
          .backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Green)
      }
      if (this.targetView == 'CalendarPicker') {
        CalendarPicker({ hintRadius: 10, selected: new Date() })
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexCalendarPickerModifier)
      }
      if (this.targetView == 'Canvas') {
        Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
          .backgroundColor('#FFFF00')
          .applyStyles(this.fancy)
          .attributeModifier(this._zIndexCanvasModifier)
      }
      if (this.targetView == 'FormLink') {
        FormLink({
          action: "router",
          abilityName: "EntryAbility",
          params: { 'message': 'testForRouter' } as Record<string, object>
        }) {
          Button("router event").width(120)
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexFormLinkModifier)
      }
      if (this.targetView == 'Hyperlink') {
        Hyperlink('https://example.com/', 'Go to the developer website') {
        }
        .applyStyles(this.fancy)
        .attributeModifier(this._zIndexHyperlinkModifier)
      }
      if (this.targetView == 'Span') {
        Text() {
          Span('Span1')
            .applyStyles(this.fancy)
        }
      }
    }
    .width(this.parentWidth)
    .height(this.parentHeight)
    .backgroundColor(this.parentBackGroundColor || '#FFFF00')
    .key(this.parentComponentKey)
  }
}