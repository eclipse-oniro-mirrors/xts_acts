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

import { attrsManager } from '../../common/AttrsManager'
import router from '@ohos.router'
import { Entry, Component, Row, Text, Color, Column, Scroller, CanvasRenderingContext2D, RenderingContextSettings,
  AlphabetIndexer, Button, Blank, Checkbox, CheckboxGroup, DataPanel, DatePicker, Divider, Gauge, Image, ImageAnimator,
  LoadingProgress, Marquee, Navigation, Menu, $r, MenuItem, QRCode, Radio, Rating, ScrollBar, Select, MenuItemOptions,
  Slider, TextArea, TextClock, TextInput, TextPicker, TimePicker, Toggle, Web, Circle, Ellipse, Line, WebviewController,
  Polyline, Polygon, Path, Rect, Shape, Badge, ColumnSplit, Counter, Flex, GridRow, Grid, List, Refresh, ProgressType, FlowItem,
  RelativeContainer, RowSplit, Scroll, SideBarContainer, Stack, Swiper, Tabs, WaterFlow, CalendarPicker,
  FormLink, Hyperlink, Progress, BarState, Search, SliderStyle, TextTimer, ToggleType, TextAlign,
  GridRowDirection, ForEach, ListItem, ListItemGroup, VerticalAlign, HorizontalAlign, SideBarContainerType, FlexAlign,
  TabContent, GridCol, GridItem, MenuItemGroup, Canvas, Span, AttributeModifier, AlphabetIndexerAttribute, BadgeAttribute, ButtonAttribute,
  BlankAttribute, CalendarPickerAttribute, CanvasAttribute, CheckboxAttribute, CheckboxGroupAttribute, CircleAttribute,
  ColumnAttribute, ColumnSplitAttribute, CounterAttribute, DataPanelAttribute, DatePickerAttribute, DividerAttribute,
  EllipseAttribute, FlexAttribute, FlowItemAttribute, FormLinkAttribute, GaugeAttribute, GridAttribute, GridColAttribute,
  GridItemAttribute, GridRowAttribute, HyperlinkAttribute, ImageAttribute, ImageAnimatorAttribute, LineAttribute, ListAttribute,
  ListItemAttribute, ListItemGroupAttribute, LoadingProgressAttribute, MarqueeAttribute, MenuAttribute, MenuItemAttribute,
  MenuItemGroupAttribute, NavDestinationAttribute, NavigationAttribute, PathAttribute, PolygonAttribute, PolylineAttribute,
  ProgressAttribute, QRCodeAttribute, RadioAttribute, RatingAttribute, RectAttribute, RefreshAttribute, RelativeContainerAttribute,
  RemoteWindowAttribute, RichEditorAttribute, RichTextAttribute, RowAttribute, RowSplitAttribute, ScrollAttribute, ScrollBarAttribute,
  SearchAttribute, SelectAttribute, ShapeAttribute, SliderAttribute, SpanAttribute, StackAttribute,
  SwiperAttribute, SideBarContainerAttribute, ToggleAttribute, TabContentAttribute, TabsAttribute,
  TextAttribute, TextAreaAttribute, TextClockAttribute, TextInputAttribute, TextPickerAttribute, TextTimerAttribute,
  TimePickerAttribute, VideoAttribute, WaterFlowAttribute, WebAttribute, WindowSceneAttribute, XComponentAttribute,
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, EffectComponentAttribute, FormComponentAttribute,
  ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, ScaleOptions } from '@ohos.arkui.component'
import { State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { SetValue, RouterParams } from '../../common/Utils';
import matrix4 from '@ohos.matrix4'

let matrix2 = matrix4.identity()
let matrix1 = matrix4.init([1.0, 0.0, 0.0, 0.0,
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

function commonStyle(this: AlphabetIndexerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: BadgeAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: BlankAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyleButton(this: ButtonAttribute, componentKey: string, _transform: matrix4.Matrix4Transit | undefined) {
  this.transform(_transform)
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CalendarPickerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CheckboxGroupAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnSplitAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CounterAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DataPanelAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DatePickerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: EffectComponentAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FormComponentAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: EllipseAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FlexAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FlowItemAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: FormLinkAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GaugeAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridColAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridItemAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: GridRowAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: HyperlinkAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ImageAnimatorAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: LineAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListItemGroupAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: LoadingProgressAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MarqueeAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: MenuItemGroupAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: NavDestinationAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: NavigationAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PathAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PolygonAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: PolylineAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ProgressAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: QRCodeAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RadioAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RatingAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RectAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RefreshAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RelativeContainerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RemoteWindowAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RichEditorAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RichTextAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RowAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: RowSplitAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ScrollBarAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SearchAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SelectAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ShapeAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SliderAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SpanAttribute, componentKey: string) {
  // this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: StackAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SwiperAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: SideBarContainerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ToggleAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TabsAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAreaAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextClockAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextInputAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextPickerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextTimerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TimePickerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: VideoAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WaterFlowAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WebAttribute, componentKey: string) {

  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: WindowSceneAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CanvasAttribute, componentKey: string) {
  this.key(componentKey)
  return this
}

function commonStyle(this: XComponentAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TextAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: DividerAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: CircleAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ColumnAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: ListAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

function commonStyle(this: TabContentAttribute, componentKey: string) {
  this.height('100%')
  this.key(componentKey)
  return this
}

@Entry
@Component
struct transformPage {
  @StoragePropRef('_transform') _transform: SetValue = {
    height: 0,transform: matrix2
  }
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
  @State _transformNavigationMod: NavigationModifier = new NavigationModifier()
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
  @State targetView: string = '';
  @State componentKey: string = '';
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State columns: number = 0
  @State gutter: number = 0
  @State parentComponentKey: string = '';

  onPageShow() {
    console.info('22222 transform page show called ')
    const viewElement = JSON.parseJsonElement(JSON.stringify(this.getUIContext().getRouter().getParams()))
      .getElement("view")
    this.targetView = viewElement.getString("targetView")
    this.componentKey = viewElement.getString("componentKey")
    this.parentWidth = viewElement.getDouble("parentWidth")
    this.parentHeight = viewElement.getDouble("parentHeight")
    this.columns = viewElement.getDouble("columns")
    this.gutter = viewElement.getDouble("gutter")
    this.parentComponentKey = viewElement.getString("parentComponentKey")
  }

  build() {
    GridRow({ columns: this.columns as Int, gutter: this.gutter, /*margin: 0 */}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').attributeModifier(this._transformButtonMod).commonStyleButton(this.componentKey, this._transform.transform)
        } else if (this.targetView == 'Text') {
          Text('text1').commonStyle(this.componentKey).attributeModifier(this._transformTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .commonStyle(this.componentKey).attributeModifier(this._transformAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._transformBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().commonStyle(this.componentKey).attributeModifier(this._transformCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).commonStyle(this.componentKey).attributeModifier(this._transformCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .commonStyle(this.componentKey).attributeModifier(this._transformDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).commonStyle(this.componentKey).attributeModifier(this._transformDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().commonStyle(this.componentKey).attributeModifier(this._transformDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .commonStyle(this.componentKey).attributeModifier(this._transformGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).commonStyle(this.componentKey).attributeModifier(this._transformImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).commonStyle(this.componentKey).attributeModifier(this._transformImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().commonStyle(this.componentKey).attributeModifier(this._transformLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as Int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).commonStyle(this.componentKey).attributeModifier(this._transformMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }.commonStyle(this.componentKey).attributeModifier(this._transformNavigationMod)
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).commonStyle(this.componentKey).attributeModifier(this._transformMenuMod)
        } else if (this.targetView == 'NavRouter') {
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle(this.componentKey)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').commonStyle(this.componentKey).attributeModifier(this._transformQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle(this.componentKey).attributeModifier(this._transformRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).commonStyle(this.componentKey).attributeModifier(this._transformRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.commonStyle(this.componentKey).attributeModifier(this._transformScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().commonStyle(this.componentKey).attributeModifier(this._transformSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).commonStyle(this.componentKey).attributeModifier(this._transformSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .commonStyle(this.componentKey).attributeModifier(this._transformSliderMod)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).commonStyle(this.componentKey).attributeModifier(this._transformTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .commonStyle(this.componentKey).attributeModifier(this._transformTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .commonStyle(this.componentKey).attributeModifier(this._transformTextPickerMod)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .commonStyle(this.componentKey).attributeModifier(this._transformTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).commonStyle(this.componentKey).attributeModifier(this._transformTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .commonStyle(this.componentKey).attributeModifier(this._transformToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          .commonStyle(this.componentKey).attributeModifier(this._transformWebMod)
        } else if (this.targetView == 'Circle') {
          Circle().commonStyle(this.componentKey)
        } else if (this.targetView == 'Ellipse') {
          Ellipse().commonStyle(this.componentKey)
        } else if (this.targetView == 'Line') {
          Line()
            .commonStyle(this.componentKey)
            .startPoint([0, 0])
            .endPoint([50, 100])
            .backgroundColor(Color.Black)
        } else if (this.targetView == 'Polyline') {
          Polyline().commonStyle(this.componentKey)
        } else if (this.targetView == 'Polygon') {
          Polygon().commonStyle(this.componentKey)
        } else if (this.targetView == 'Path') {
          Path().commonStyle(this.componentKey)
        } else if (this.targetView == 'Rect') {
          Rect().commonStyle(this.componentKey)
        } else if (this.targetView == 'Shape') {
          Shape() {
            Rect().width(100).height(50)
          }.commonStyle(this.componentKey)
        } else if (this.targetView == 'Badge') {
          Badge({
            count: 50,
            style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          } as BadgeParamWithNumber) {
            Button('message')
              .width(100).height(50).backgroundColor(0x317aff)
          }.commonStyle(this.componentKey).attributeModifier(this._transformBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.commonStyle(this.componentKey).attributeModifier(this._transformColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.commonStyle(this.componentKey).attributeModifier(this._transformColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.commonStyle(this.componentKey).attributeModifier(this._transformCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.commonStyle(this.componentKey).attributeModifier(this._transformFlexMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._transformGridRowMod)
        } else if (this.targetView == 'Grid') {
          Grid() {
            ForEach(['0', '1', '2', '3', '4'], (item: string) => {
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
          .commonStyle(this.componentKey).attributeModifier(this._transformGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.commonStyle(this.componentKey).height('100%').width('100%').attributeModifier(this._transformListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle(this.componentKey).attributeModifier(this._transformListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .commonStyle(this.componentKey).attributeModifier(this._transformListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
        } else if (this.targetView == 'Panel') {
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.commonStyle(this.componentKey).attributeModifier(this._transformRefreshMod)
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
          }.commonStyle(this.componentKey).attributeModifier(this._transformRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().commonStyle(this.componentKey).attributeModifier(this._transformRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.commonStyle(this.componentKey).attributeModifier(this._transformRowSplitMod)
        } else if (this.targetView == 'Scroll') {
          Scroll() {
            Column() {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
                Text('Scroll' + item.toString())
                  .width('90%')
                  .height(50)
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
              }, (item: int) => item.toString())
            }.width('100%')
          }.scrollBar(BarState.On).commonStyle(this.componentKey).attributeModifier(this._transformScrollMod)
        } else if (this.targetView == 'SideBarContainer') {
          SideBarContainer(SideBarContainerType.Embed) {
            Column() {
              ForEach([1, 2, 3], (item: int) => {
                Column({ space: 5 } as ColumnOptions) {
                  Image($r('app.media.icon')).width(50).height(50)
                  Text('Index0' + item).fontSize(25)
                }
              })
            }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

            Column() {
              Text('SideBarContainer content').fontSize(25)
            }.backgroundColor(Color.Orange)
          }.commonStyle(this.componentKey).attributeModifier(this._transformSideBarContainerMod)
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.commonStyle(this.componentKey).attributeModifier(this._transformStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .commonStyle(this.componentKey).attributeModifier(this._transformSwiperMod)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.commonStyle(this.componentKey).attributeModifier(this._transformTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').commonStyle(this.componentKey).attributeModifier(this._transformTabContentMod)
          }.width('100%').height('100%')
        } else if (this.targetView == 'WaterFlow') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
            }, (item: int) => item.toString())
          }.commonStyle(this.componentKey).attributeModifier(this._transformWaterFlowMod)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .commonStyle(this.componentKey).attributeModifier(this._transformGridColMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'FlowItem') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
              .commonStyle(this.componentKey).attributeModifier(this._transformFlowItemMod)
              .backgroundColor(Color.Yellow)
            }, (item: int) => item.toString())
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
            .commonStyle(this.componentKey).attributeModifier(this._transformGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .commonStyle(this.componentKey).attributeModifier(this._transformMenuItemMod)
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
              .commonStyle(this.componentKey).attributeModifier(this._transformMenuItemGroupMod)
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