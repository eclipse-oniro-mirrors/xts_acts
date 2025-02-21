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

import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../../test/List.test'
import { Callback } from '@ohos.base'
import { MessageManager } from '../../common/MessageManager';

@Entry
@Component
struct SliderExample {
  @State caretWidthNumber: number = 5
  @State caretWidthString: string = '15px'
  @State caretWidthResource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
  @State caretColorColor: Color = Color.Red
  @State caretColorNumber: number = 0x000000
  @State caretColorString: string = '#ff9a35'
  @State caretColorResource: Resource = $r('sys.color.ohos_id_color_connected')
  @State leftSearchIconSizeNumber: number = 20
  @State leftSearchIconSizeString: string = '50px'
  @State leftSearchIconSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
  @State leftSearchIconColorColor: Color = Color.Red
  @State leftSearchIconColorNumber: number = 0x000000
  @State leftSearchIconColorString: string = '#ff9a35'
  @State leftSearchIconColorResource: Resource = $r('sys.color.ohos_id_color_connected')
  @State searchSrcPath: string = 'common/icon.png'
  @State searchSrcPathResource: Resource = $r('sys.media.ohos_app_icon')
  @State rightButtonStyleParam: CancelButtonStyle = CancelButtonStyle.INPUT
  @State rightCancelIconSizeNumber: number = 20
  @State rightCancelIconSizeString: string = '50px'
  @State rightCancelIconSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
  @State rightCancelIconColorColor: Color = Color.Red
  @State rightCancelIconColorNumber: number = 0x000000
  @State rightCancelIconColorString: string = '#ff9a35'
  @State rightCancelIconColorResource: Resource = $r('sys.color.ohos_id_color_connected')
  @State rightIconSrcPath: string = 'common/icon.png'
  @State rightIconSrcPathResource: Resource = $r('sys.media.ohos_app_icon')
  @State searchButtonFontSizeNumber: number = 20
  @State searchButtonFontSizeString: string = '10vp'
  @State searchButtonFontSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
  @State searchButtonFontColorColor: Color = Color.Blue
  @State searchButtonFontColorNumber: number = 0x000000
  @State searchButtonFontColorString: string = '#ff9a35'
  @State searchButtonFontColorResource: Resource = $r('sys.color.ohos_id_color_connected')
  @State textColorColor: Color = Color.Red
  @State textColorNumber: number = 0x000000
  @State textColorString: string = '#ff9a35'
  @State textColorResource: Resource = $r('sys.color.ohos_id_color_connected')
  @State placeholderFont: Font = { size: '16sp', weight: FontWeight.Normal }
  @State textFont: Font = { size: '16sp', weight: FontWeight.Normal }
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("search page state change called:" + JSON.stringify(eventData));
    this.caretWidthNumber = eventData.data?.caretWidthNumber;
    this.caretWidthString = eventData.data?.caretWidthString;
    this.caretWidthResource = eventData.data?.caretWidthResource;
    this.caretColorColor = eventData.data?.caretColorColor;
    this.caretColorNumber = eventData.data?.caretColorNumber;
    this.caretColorString = eventData.data?.caretColorString;
    this.caretColorResource = eventData.data?.caretColorResource;
    this.leftSearchIconSizeNumber = eventData.data?.leftSearchIconSizeNumber;
    this.leftSearchIconSizeString = eventData.data?.leftSearchIconSizeString;
    this.leftSearchIconSizeResource = eventData.data?.leftSearchIconSizeResource;
    this.leftSearchIconColorColor = eventData.data?.leftSearchIconColorColor;
    this.leftSearchIconColorNumber = eventData.data?.leftSearchIconColorNumber;
    this.leftSearchIconColorString = eventData.data?.leftSearchIconColorString;
    this.leftSearchIconColorResource = eventData.data?.leftSearchIconColorResource;
    this.searchSrcPath = eventData.data?.searchSrcPath;
    this.searchSrcPathResource = eventData.data?.searchSrcPathResource;
    this.rightButtonStyleParam = eventData.data?.rightButtonStyleParam;
    this.rightCancelIconSizeNumber = eventData.data?.rightCancelIconSizeNumber;
    this.rightCancelIconSizeString = eventData.data?.rightCancelIconSizeString;
    this.rightCancelIconSizeResource = eventData.data?.rightCancelIconSizeResource;
    this.rightCancelIconColorColor = eventData.data?.rightCancelIconColorColor;
    this.rightCancelIconColorNumber = eventData.data?.rightCancelIconColorNumber;
    this.rightCancelIconColorString = eventData.data?.rightCancelIconColorString;
    this.rightCancelIconColorResource = eventData.data?.rightCancelIconColorResource;
    this.rightIconSrcPath = eventData.data?.rightIconSrcPath;
    this.rightIconSrcPathResource = eventData.data?.rightIconSrcPathResource;
    this.searchButtonFontSizeNumber = eventData.data?.searchButtonFontSizeNumber;
    this.searchButtonFontSizeString = eventData.data?.searchButtonFontSizeString;
    this.searchButtonFontSizeResource = eventData.data?.searchButtonFontSizeResource;
    this.searchButtonFontColorColor = eventData.data?.searchButtonFontColorColor;
    this.searchButtonFontColorNumber = eventData.data?.searchButtonFontColorNumber;
    this.searchButtonFontColorString = eventData.data?.searchButtonFontColorString;
    this.searchButtonFontColorResource = eventData.data?.searchButtonFontColorResource;
    this.textColorColor = eventData.data?.textColorColor;
    this.textColorNumber = eventData.data?.textColorNumber;
    this.textColorString = eventData.data?.textColorString;
    this.textColorResource = eventData.data?.textColorResource;
  }
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('search onPageShow')
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    }
    let callback: Callback<ESObject> = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'caretWidthResource') {
        this.caretWidthResource = message.value
      }
      if (message.name == 'caretColorResource') {
        this.caretColorResource = message.value
      }
      if (message.name == 'leftSearchIconColorResource') {
        this.leftSearchIconColorResource = message.value
      }
      if (message.name == 'searchSrcPathResource') {
        this.searchSrcPathResource = message.value
      }
      if (message.name == 'rightCancelIconColorResource') {
        this.rightCancelIconColorResource = message.value
      }
      if (message.name == 'rightIconSrcPathResource') {
        this.rightIconSrcPathResource = message.value
      }
      if (message.name == 'searchButtonFontSizeResource') {
        this.searchButtonFontSizeResource = message.value
      }
      if (message.name == 'searchButtonFontColorResource') {
        this.searchButtonFontColorResource = message.value
      }
      if (message.name == 'textColorResource') {
        this.textColorResource = message.value
      }


    }
    this.messageManager.registerCallback(callback)
  }

  aboutToAppear() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }

    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    // Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
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
        })
        .cancelButton({
          icon: {
            color: $r('sys.color.ohos_id_color_secondary'),
          }
        })
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
        })
        .cancelButton({
          icon: {
            color: $r('sys.color.ohos_id_color_secondary'),
          }
        })
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
        })
        .cancelButton({
          icon: {
            color: $r('sys.color.ohos_id_color_secondary'),
          }
        })
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
        })
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeNumber,
            color: this.rightCancelIconColorNumber,
            src: this.rightIconSrcPath
          }
        })
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeNumber,
            fontColor: this.searchButtonFontColorNumber
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorNumber)
        .key('searchTestfontcaretcolor')

      Search({ value: '', placeholder: 'Type to search...' })
        .caretStyle({
          color: $r('sys.color.ohos_id_color_text_primary_activated')
        })
        .searchIcon({
          color: $r('sys.color.ohos_id_color_secondary'),
        })
        .cancelButton({
          icon: {
            color: $r('sys.color.ohos_id_color_secondary'),
          }
        })
        .searchButton(
          'Search',
          {
            fontSize: $r('sys.float.ohos_id_text_size_body1'),
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
          color: this.caretColorNumber
        })
        .searchIcon({
          size: this.leftSearchIconSizeNumber,
          color: this.leftSearchIconColorNumber,
          src: this.searchSrcPath
        })
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeNumber,
            color: this.rightCancelIconColorNumber,
            src: this.rightIconSrcPath
          }
        })
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeNumber,
            fontColor: this.searchButtonFontColorNumber
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorNumber)
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
        })
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeString,
            color: this.rightCancelIconColorString,
            src: this.rightIconSrcPath
          }
        })
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
        })
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeResource,
            color: this.rightCancelIconColorResource,
            src: this.rightIconSrcPathResource
          }
        })
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
        })
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeResource,
            color: $r('sys.color.ohos_id_color_connected'),
            src: this.rightIconSrcPathResource
          }
        })
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
        })
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeNumber,
            color: this.rightCancelIconColorColor,
            src: this.rightIconSrcPath
          }
        })
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
