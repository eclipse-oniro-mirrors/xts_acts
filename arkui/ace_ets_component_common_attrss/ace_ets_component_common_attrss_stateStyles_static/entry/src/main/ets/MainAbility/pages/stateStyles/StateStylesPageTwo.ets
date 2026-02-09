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
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router'
import {
  MenuItemGroup,MenuItemGroupOptions,ImageFit,FlowItem,TabContent,ListItemGroup,ListItem,SliderStyle,BadgeParamWithNumber,Blank,Entry,Component,$r,
  AlignRuleOption,Row,Button,Margin,IDataSource,DataChangeListener,SwiperController,Column,ColumnOptions,ClickEvent,RowOptions,LazyForEach,
  Text,FlexAlign,TextCase,TextDecorationType,Resource,VerticalAlign,HorizontalAlign,RelativeContainer,CommonMethod,applyStyles,Builder,
  Color,Scroller,Menu,ScrollBar,TextTimer,ColumnSplit,RowSplit,Refresh,Shape,Rect,Path,Polygon,Polyline,Line,Ellipse,
  Circle,WaterFlow,Tabs,Swiper,Stack,SideBarContainer,Scroll,List,GridRow,Grid,Flex,Counter,Badge,Toggle,TimePicker,TextPicker,TextInput,TextClock,TextArea,Slider,
  Search,Rating,QRCode,Progress,AlphabetIndexer,ImageAnimator,Image,Navigation,Marquee,LoadingProgress,Gauge,Divider,DatePicker,DataPanel,CheckboxGroup,Checkbox,
  Select,Radio,MenuItem,ProgressType,ToggleType,ForEach,GridRowDirection,BarState,SideBarContainerType,TextAlign,GridItem,BadgeStyle,BadgeParamWithString,
  GutterOption,BreakPoints,BreakpointsReference,GridCol,GridColOptions,GridColColumnOption,ColumnOptions,
  MenuItemOptions,CheckboxGroupOptions,DataPanelOptions,DatePickerOptions,ProgressOptions,RadioOptions,SliderOptions
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State,StoragePropRef } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct StateStylesPageTwo {
  @StoragePropRef('_isSelect') _isSelect: boolean = true
  @State targetView: string = ''
  @State componentKey: string = ''

  onPageShow() {
    console.info('StateStylesPageTwo show called ')
    AppStorage.setOrCreate<boolean>('_isSelect', true)
    console.info('this._isSelect:' + this._isSelect)
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey
    } catch (error: Error) {
      console.log(' routerParamOptions error ' + error);
    }
  }
  @Builder
  myBuilder() {
    Column() {
      Text("bindSheet")
        .fontSize(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }

  selectedStyles(instance: CommonMethod) {
    instance.zIndex(2)
  }
  normalStyles(instance: CommonMethod) {
    instance.zIndex(1)
  }

  commonStyle(instance: CommonMethod){
    instance.key(this.componentKey)
    instance.stateStyles({
      normal: this.normalStyles,
      selected: this.selectedStyles
    })
  }


  build() {
    Row() {
      Stack() {
        if (this.targetView == 'Checkbox') {
          Checkbox().applyStyles(this.commonStyle).select(this._isSelect)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).applyStyles(this.commonStyle).selectAll(this._isSelect)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).applyStyles(this.commonStyle).checked(this._isSelect)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: this._isSelect }).applyStyles(this.commonStyle)
        } else if (this.targetView == 'MenuItem') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .applyStyles(this.commonStyle).selected(this._isSelect)
          }.backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }
      }
      .backgroundColor(Color.Pink)
      .width('100%')
      .width('100%')
    }
    .backgroundColor(Color.Yellow)
  }
}