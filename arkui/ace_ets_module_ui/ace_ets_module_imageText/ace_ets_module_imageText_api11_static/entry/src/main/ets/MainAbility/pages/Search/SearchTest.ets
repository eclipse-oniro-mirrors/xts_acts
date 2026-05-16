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

import emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { MessageManagerBase, CallbackBase, MessageBase } from '../../common/MessageManager2';
import { State, AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement';
import {
  Entry,
  Component,
  Column,
  Search,
  SearchType,
  Resource,
  Color,
  CancelButtonStyle,
  Font,
  IconOptions,
  CancelButtonOptions,
  $r,
  FontWeight
} from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';

export class SliderExampleManager {
  name: string = ''
  message: MessageManager = new MessageManager()
}

@Entry
@Component
struct SliderExample {
  @State caretWidthNumber: number = 5
  @State caretWidthString: string = '15px'
  @State caretWidthResource: undefined | Resource = $r('sys.float.ohos_id_text_margin_vertical')
  @State caretColorColor: undefined | Color = Color.Red
  @State caretColorNumber: number = 0x000000
  @State caretColorString: string = '#ff9a35'
  @State caretColorResource: undefined | Resource = $r('sys.color.ohos_id_color_connected')
  @State leftSearchIconSizeNumber: number = 20
  @State leftSearchIconSizeString: string = '50px'
  @State leftSearchIconSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
  @State leftSearchIconColorColor: Color = Color.Red
  @State leftSearchIconColorNumber:  int = 0x000000
  @State leftSearchIconColorString: string = '#ff9a35'
  @State leftSearchIconColorResource: undefined | Resource = $r('sys.color.ohos_id_color_connected')
  @State searchSrcPath: string = 'common/icon.png'
  @State searchSrcPathResource: undefined | Resource = $r('sys.media.ohos_app_icon')
  @State rightButtonStyleParam: CancelButtonStyle = CancelButtonStyle.INPUT
  @State rightCancelIconSizeNumber: number = 20
  @State rightCancelIconSizeString: string = '50px'
  @State rightCancelIconSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
  @State rightCancelIconColorColor: Color = Color.Red
  @State rightCancelIconColorNumber: number = 0x000000
  @State rightCancelIconColorString: string = '#ff9a35'
  @State rightCancelIconColorResource: undefined | Resource = $r('sys.color.ohos_id_color_connected')
  @State rightIconSrcPath: string = 'common/icon.png'
  @State rightIconSrcPathResource: undefined | Resource = $r('sys.media.ohos_app_icon')
  @State searchButtonFontSizeNumber: number = 20
  @State searchButtonFontSizeString: string = '10vp'
  @State searchButtonFontSizeResource: undefined | Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
  @State searchButtonFontColorColor: undefined | Color = Color.Blue
  @State searchButtonFontColorNumber: number = 0x000000
  @State searchButtonFontColorString: string = '#ff9a35'
  @State searchButtonFontColorResource: undefined | Resource = $r('sys.color.ohos_id_color_connected')
  @State textColorColor: Color = Color.Red
  @State textColorNumber: number = 0x000000
  @State textColorString: string = '#ff9a35'
  @State textColorResource: undefined | Resource = $r('sys.color.ohos_id_color_connected')
  @State placeholderFont: undefined | Font = { size: '16sp', weight: FontWeight.Normal } as Font
  @State textFont: undefined | Font = { size: '16sp', weight: FontWeight.Normal } as Font
  private stateChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info("search page state change called:" + JSON.stringify(eventData));
    console.info("======================================== search page state change called:" + JSON.stringify(eventData));
    if (eventData.data === null || eventData.data === undefined) {
      return
    }
  }
  messageManager: MessageManager = new MessageManager()
  messageManager_base: MessageManagerBase<number|int|string> = new MessageManagerBase<number|int|string>()
  messageManager_color: MessageManagerBase<Color> = new MessageManagerBase<Color>()
  messageManager_resource: MessageManagerBase<Resource> = new MessageManagerBase<Resource>()
  messageManager_CancelButtonStyle: MessageManagerBase<CancelButtonStyle> = new MessageManagerBase<CancelButtonStyle>()
  onPageShow() {
    console.info('search onPageShow')
    AppStorage.setOrCreate<MessageManager>('messageManager', this.messageManager);
    AppStorage.setOrCreate<MessageManagerBase<number|int|string>>('messageManagerBase', this.messageManager_base);
    AppStorage.setOrCreate<MessageManagerBase<Color>>('messageManagerColor', this.messageManager_color);
    AppStorage.setOrCreate<MessageManagerBase<Resource>>('messageManagerResource', this.messageManager_resource);
    AppStorage.setOrCreate<MessageManagerBase<CancelButtonStyle>>('messageManager_CancelButtonStyle', this.messageManager_CancelButtonStyle);
    const sliderExampleManager = new SliderExampleManager();
    sliderExampleManager.message = this.messageManager;
    sliderExampleManager.name = 'messageManager'
    AppStorage.setOrCreate<SliderExampleManager>('sliderExampleManager', sliderExampleManager)
    let callback: Callback = (message: Message) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'caretWidthResource') {
        this.caretWidthResource = message.value as Resource
      }
      if (message.name == 'caretColorResource') {
        this.caretColorResource = message.value as Resource
      }
      if (message.name == 'leftSearchIconColorResource') {
        this.leftSearchIconColorResource = message.value as Resource
      }
      if (message.name == 'searchSrcPathResource') {
        this.searchSrcPathResource = message.value as Resource
      }
      if (message.name == 'rightCancelIconColorResource') {
        this.rightCancelIconColorResource = message.value as Resource
      }
      if (message.name == 'rightIconSrcPathResource') {
        this.rightIconSrcPathResource = message.value as Resource
      }
      if (message.name == 'searchButtonFontSizeResource') {
        this.searchButtonFontSizeResource = message.value as Resource
      }
      if (message.name == 'searchButtonFontColorResource') {
        this.searchButtonFontColorResource = message.value as Resource
      }
      if (message.name == 'textColorResource') {
        this.textColorResource = message.value as Resource
      }
    }
    let callbackBase: CallbackBase<number|int|string> = (message: MessageBase<number|int|string>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'caretWidthNumber') {
        this.caretWidthNumber = message.value as number
        console.log("==============================================caretWidthNumber " + this.caretWidthNumber)
      }

      if (message.name == 'leftSearchIconSizeNumber') {
        this.leftSearchIconSizeNumber = message.value as number
        console.log("==============================================leftSearchIconSizeNumber " + this.leftSearchIconSizeNumber)
      }
      if (message.name == 'rightCancelIconSizeNumber') {
        this.rightCancelIconSizeNumber = message.value as number

        console.log("==============================================rightCancelIconSizeNumber " + this.rightCancelIconSizeNumber)
      }
      if (message.name == 'searchButtonFontSizeString') {
        this.searchButtonFontSizeString = message.value as string
        console.log("==============================================searchButtonFontSizeString " + this.searchButtonFontSizeString)
      }
      if (message.name == 'searchButtonFontSizeNumber') {
        this.searchButtonFontSizeNumber = message.value as number
        console.log("==============================================searchButtonFontSizeNumber " + this.searchButtonFontSizeNumber)
      }
      if (message.name == 'searchButtonFontColorNumber') {
        this.searchButtonFontColorNumber = message.value as number
        console.log("==============================================searchButtonFontColorNumber " + this.searchButtonFontColorNumber)
      }

      if (message.name == 'searchButtonFontColorString') {
        this.searchButtonFontColorString = message.value as string
        console.log("==============================================searchButtonFontColorString " + this.searchButtonFontColorString)
      }

      if (message.name == 'textColorString') {
        this.textColorString = message.value as string
        console.log("==============================================textColorString " + this.textColorString)
      }
      if (message.name == 'textColorNumber') {
        this.textColorNumber = message.value as number
        console.log("==============================================textColorNumber " + this.textColorNumber)
      }
      if (message.name == 'caretWidthString') {
        this.caretWidthString = message.value as string

        console.log("==============================================caretWidthString " + this.caretWidthString)
      }
      if (message.name == 'caretColorNumber') {
        this.caretColorNumber = message.value as number
        console.log("==============================================caretColorNumber " + this.caretColorNumber)
      }
      if (message.name == 'caretColorString') {
        this.caretColorString = message.value as string
        console.log("==============================================caretColorString " + this.caretColorString)
      }
      if (message.name == 'leftSearchIconSizeString') {
        this.leftSearchIconSizeString = message.value as string
        console.log("==============================================leftSearchIconSizeString " + this.leftSearchIconSizeString)
      }

      if (message.name == 'leftSearchIconColorNumber') {
        this.leftSearchIconColorNumber = message.value as int
        console.log("==============================================leftSearchIconColorNumber " + this.leftSearchIconColorNumber)
      }
      if (message.name == 'leftSearchIconColorString') {
        this.leftSearchIconColorString = message.value as string
        console.log("==============================================leftSearchIconColorString " + this.leftSearchIconColorString)
      }
      if (message.name == 'searchSrcPath') {
        this.searchSrcPath = message.value as string
        console.log("==============================================searchSrcPath " + this.searchSrcPath)
      }
      if (message.name == 'rightCancelIconSizeString') {
        this.rightCancelIconSizeString = message.value as string
        console.log("==============================================rightCancelIconSizeString " + this.rightCancelIconSizeString)
      }
      if (message.name == 'rightCancelIconColorNumber') {
        this.rightCancelIconColorNumber = message.value as number
        console.log("==============================================rightCancelIconColorNumber " + this.rightCancelIconColorNumber)
      }
      if (message.name == 'rightCancelIconColorString') {
        this.rightCancelIconColorString = message.value as string
        console.log("==============================================rightCancelIconColorString " + this.rightCancelIconColorString)
      }
      if (message.name == 'rightIconSrcPath') {
        this.rightIconSrcPath = message.value as string
        console.log("==============================================rightIconSrcPath " + this.rightIconSrcPath)
      }
    }

    let callbackColor: CallbackBase<Color> = (message: MessageBase<Color>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'searchButtonFontColorColor') {
        this.searchButtonFontColorColor = message.value
        console.log("==============================================searchButtonFontColorColor " + this.searchButtonFontColorColor)
      }
      if (message.name == 'textColorColor') {
        this.textColorColor = message.value
        console.log("==============================================textColorColor " + this.textColorColor)
      }
      if (message.name == 'caretColorColor') {
        this.caretColorColor = message.value
        console.log("==============================================caretColorColor " + this.caretColorColor)
      }
      if (message.name == 'leftSearchIconColorColor') {
        this.leftSearchIconColorColor = message.value
        console.log("==============================================caretColorColor " + this.leftSearchIconColorColor)
      }
      if (message.name == 'rightCancelIconColorColor') {
        this.rightCancelIconColorColor = message.value
        console.log("==============================================caretColorColor " + this.rightCancelIconColorColor)
      }
    }

    let callbackResource: CallbackBase<Resource> = (message: MessageBase<Resource>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'leftSearchIconSizeResource') {
        this.leftSearchIconSizeResource = message.value
      }
      if (message.name == 'rightCancelIconSizeResource') {
        this.rightCancelIconSizeResource = message.value
      }
    }

    let callbackCancelButtonStyle: CallbackBase<CancelButtonStyle> = (message: MessageBase<CancelButtonStyle>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'rightButtonStyleParam') {
        this.rightButtonStyleParam = message.value
      }
    }
    this.messageManager_CancelButtonStyle.registerCallback(callbackCancelButtonStyle)
    this.messageManager_resource.registerCallback(callbackResource)
    this.messageManager_color.registerCallback(callbackColor)
    this.messageManager_base.registerCallback(callbackBase)
    this.messageManager.registerCallback(callback)
  }

  aboutToAppear() {
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 183,
      priority: emitter.EventPriority.LOW
    }

    emitter.on(stateChangeEvent, this.stateChangCallBack)
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
  }

  build() {
    Column() {
      Search({ value: '', placeholder: 'Type to search...' })
        .searchButton('Search')
        .key('searchTestDefault')

      Search({ value: '', placeholder: 'Type to search...' })
        .caretStyle({
          color: $r('app.color.Caretcolor'),
          width: $r('app.float.Caretwidth')
        })
        .searchIcon({
          color: $r('sys.color.ohos_id_color_secondary'),
        } as IconOptions)
        .cancelButton({
          icon: {
            color: $r('sys.color.ohos_id_color_secondary'),
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: $r('sys.float.ohos_id_text_size_body1'),
            fontColor: $r('sys.color.ohos_id_color_text_primary_activated')
          }
        )
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .key('searchTestDefaultapp')

      Search({ value: '', placeholder: 'Type to search...' })
        .caretStyle({
          color: $r('app.color.Caretcolor'),
          width: $r('app.string.Caretwidth001')
        })
        .searchIcon({
          color: $r('sys.color.ohos_id_color_secondary'),
        } as IconOptions)
        .cancelButton({
          icon: {
            color: $r('sys.color.ohos_id_color_secondary'),
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: $r('sys.float.ohos_id_text_size_body1'),
            fontColor: $r('sys.color.ohos_id_color_text_primary_activated')
          }
        )
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .key('searchTestDefaultapp001')

      Search({ value: '', placeholder: 'Type to search...' })
        .caretStyle({
          color: $r('app.color.Caretcolor'),
          width: $r('app.integer.Caretwidth')
        })
        .searchIcon({
          color: $r('sys.color.ohos_id_color_secondary'),
        } as IconOptions)
        .cancelButton({
          icon: {
            color: $r('sys.color.ohos_id_color_secondary'),
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: $r('sys.float.ohos_id_text_size_body1'),
            fontColor: $r('sys.color.ohos_id_color_text_primary_activated')
          }
        )
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .key('searchTestDefaultapp002')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .searchIcon({
          size: this.leftSearchIconSizeNumber,
          color: this.leftSearchIconColorNumber,
          src: this.searchSrcPath
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeNumber,
            color: this.rightCancelIconColorNumber as int,
            src: this.rightIconSrcPath
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeNumber,
            fontColor: this.searchButtonFontColorNumber as int
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorNumber as int)
        .key('searchTestfontcaretcolor')

      Search({ value: '', placeholder: 'Type to search...' })
        .caretStyle({
          color: $r('sys.color.ohos_id_color_text_primary_activated')
        })
        .searchIcon({
          color: $r('sys.color.search_icon_color'),
        } as IconOptions)
        .cancelButton({
          icon: {
            color: $r('sys.color.search_icon_color'),
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: $r('sys.float.Body_M'),
            fontColor: $r('sys.color.ohos_id_color_text_primary_activated')
          }
        )
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .key('searchTestDefaultValue')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .caretStyle({
          width: this.caretWidthNumber,
          color: this.caretColorNumber as int
        })
        .searchIcon({
          size: this.leftSearchIconSizeNumber,
          color: this.leftSearchIconColorNumber,
          src: this.searchSrcPath
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeNumber,
            color: this.rightCancelIconColorNumber as int,
            src: this.rightIconSrcPath
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeNumber,
            fontColor: this.searchButtonFontColorNumber as int
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorNumber as int)
        .key('searchTestNumber')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .caretStyle({
          width: this.caretWidthString,
          color: this.caretColorString
        })
        .searchIcon({
          size: this.leftSearchIconSizeString,
          color: this.leftSearchIconColorString,
          src: this.searchSrcPath
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeString,
            color: this.rightCancelIconColorString,
            src: this.rightIconSrcPath
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeString,
            fontColor: this.searchButtonFontColorString
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorString)
        .key('searchTestString')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .caretStyle({
          width: this.caretWidthResource,
          color: this.caretColorResource
        })
        .searchIcon({
          size: this.leftSearchIconSizeResource,
          color: this.leftSearchIconColorResource,
          src: this.searchSrcPathResource
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeResource,
            color: this.rightCancelIconColorResource,
            src: this.rightIconSrcPathResource
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeResource,
            fontColor: this.searchButtonFontColorResource
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorResource)
        .key('searchTestResource')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .caretStyle({
          width: this.caretWidthResource,
          color: $r('sys.color.ohos_id_color_connected')
        })
        .searchIcon({
          size: this.leftSearchIconSizeResource,
          color: $r('sys.color.ohos_id_color_connected'),
          src: this.searchSrcPathResource
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeResource,
            color: $r('sys.color.ohos_id_color_connected'),
            src: this.rightIconSrcPathResource
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeResource,
            fontColor: $r('sys.color.ohos_id_color_connected')
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor($r('sys.color.ohos_id_color_connected'))
        .key('searchTestResource2')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .caretStyle({
          width: this.caretWidthNumber,
          color: this.caretColorColor
        })
        .searchIcon({
          size: this.leftSearchIconSizeNumber,
          color: this.leftSearchIconColorColor,
          src: this.searchSrcPath
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeNumber,
            color: this.rightCancelIconColorColor,
            src: this.rightIconSrcPath
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeNumber,
            fontColor: this.searchButtonFontColorColor
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorColor)
        .key('searchTestColor')
    }
    .width('100%')
    .height('100%')
  }
}
