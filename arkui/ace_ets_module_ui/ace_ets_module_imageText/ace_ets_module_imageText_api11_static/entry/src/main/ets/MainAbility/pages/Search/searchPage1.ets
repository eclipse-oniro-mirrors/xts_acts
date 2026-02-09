'use static';
/**
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

import emitter from '@ohos.events.emitter';
import { Entry, Component, AttributeModifier, SearchAttribute, Column, Search, Text, ColumnOptions, CancelButtonStyle,
  Color, FontWeight, FontStyle, CopyOptions, TextAlign, IconOptions, CancelButtonSymbolOptions,CancelButtonOptions
} from '@ohos.arkui.component';
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

@Observed
class SearchModifier implements AttributeModifier<SearchAttribute> {
  _testType: number = 0
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`Search page Test Type ${this._testType}`)
    if(this._testType === 0)
    {
      console.info(`Search.selectionMenuHidden=>false`)
      instance.selectionMenuHidden(false)
    } else if(this._testType === 1){
      console.info(`Search.selectionMenuHidden=>false`)
      instance.selectionMenuHidden(false)
    } else if(this._testType === 2){
      console.info(`Search.caretStyle=>{width: '10',color: Color.Black}`)
      instance.caretStyle({
        width: '10',
        color: Color.Black
      })
    } else if(this._testType === 3){
      console.info(`Search.enableKeyboardOnFocus=>false`)
      instance.enableKeyboardOnFocus(false)
    } else if(this._testType === 4){
      console.info(`Search.placeholderFont=>{size: 16.0, weight: FontWeight.Normal, family: 'Arial, HarmonyOS Sans', style: FontStyle.Normal}`)
      instance.placeholderFont({
        size: 16.0,
        weight: FontWeight.Normal,
        family: 'Arial, HarmonyOS Sans',
        style: FontStyle.Normal
      })
    } else if(this._testType === 5){
      console.info(`Search.searchIcon=>{size: '30vp', color: Color.Red}`)
      instance.searchIcon({
        size: '30vp',
        color: '#FFFF0000',
      } as IconOptions)
    } else if(this._testType === 6){
      console.info(`Search.searchButton=>'SEARCH',{fontSize: 10, fontColor: Color.Black}`)
      instance.searchButton(
        'SEARCH',
        {
          fontSize: 10,
          fontColor: Color.Black
        }
      )
    } else if(this._testType === 7){
      console.info(`Search.fontColor=>Color.Red`)
      instance.fontColor(Color.Red)
    } else if(this._testType === 8){
      console.info(`Search.copyOption=>CopyOptions.InApp`)
      instance.copyOption(CopyOptions.InApp)
    } else if(this._testType === 9){
      console.info(`Search.textFont=>{size: 16.0, weight: FontWeight.Normal, family: 'Arial, HarmonyOS Sans', style: FontStyle.Normal}`)
      instance.textFont({
        size: 16.0,
        weight: FontWeight.Normal,
        family: 'Arial, HarmonyOS Sans',
        style: FontStyle.Normal
      })
    } else if(this._testType === 10){
      console.info(`Search.placeholderColor=>Color.Red`)
      instance.placeholderColor(Color.Red)
    } else if(this._testType === 11){
      console.info(`Search.cancelButton=>{style: CancelButtonStyle.CONSTANT, icon: {size: '10vp', color: Color.Black}}`)
      instance.cancelButton({
        style: CancelButtonStyle.CONSTANT,
        icon: {
          size: '10vp',
          color: Color.Black
        }
      } as CancelButtonOptions)
    } else if(this._testType === 12){
      console.info(`Search.textAlign=>TextAlign.Center`)
       instance.textAlign(TextAlign.Center)
    }
  }
}

@Entry
@Component
struct SearchExample {
  @State _SearchModifier: SearchModifier = new SearchModifier();
  @State submitValue: string = ''
  private stateChangCallBack: (eventData: emitter.EventData) => void  = (eventData:emitter.EventData) => {
    if (eventData != null) {
      console.info("Search page state change called:" + JSON.stringify((eventData.data as Record<String,RecordData>)['typeValue']));
      if ((eventData.data as Record<String,RecordData>)['typeValue'] != null) {
        console.log("======================================= this._SearchModifier._testType" + this._SearchModifier._testType);
        console.log("=======================================  " + Number.parseInt(`${((eventData.data as Record<String,RecordData>)!['typeValue'])!}`))
        this._SearchModifier._testType = Number.parseInt(`${((eventData.data as Record<String,RecordData>)!['typeValue'])!}`);
        console.log("======================================= this._SearchModifier._testType" + this._SearchModifier._testType);
      }
      else {
        this._SearchModifier._testType = 0;
      }
    }
  }

  onPageShow() {

    let stateChangeEvent01: emitter.InnerEvent = {
      eventId: 1401,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent01, this.stateChangCallBack);

    let stateChangeEvent02: emitter.InnerEvent = {
      eventId: 1501,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent02, this.stateChangCallBack);

     let stateChangeEvent03: emitter.InnerEvent = {
      eventId: 1601,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent03, this.stateChangCallBack);

    let stateChangeEvent04: emitter.InnerEvent = {
      eventId: 1701,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent04, this.stateChangCallBack);

    let stateChangeEvent05: emitter.InnerEvent = {
      eventId: 1801,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent05, this.stateChangCallBack);

    let stateChangeEvent06: emitter.InnerEvent = {
      eventId: 1901,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent06, this.stateChangCallBack);

     let stateChangeEvent07: emitter.InnerEvent = {
      eventId: 2001,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent07, this.stateChangCallBack);


    let stateChangeEvent08: emitter.InnerEvent = {
      eventId: 2101,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent08, this.stateChangCallBack);

    let stateChangeEvent09: emitter.InnerEvent = {
      eventId: 2201,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent09, this.stateChangCallBack);


    let stateChangeEvent10: emitter.InnerEvent = {
      eventId: 2301,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent10, this.stateChangCallBack);

     let stateChangeEvent11: emitter.InnerEvent = {
      eventId: 2401,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent11, this.stateChangCallBack);


    let stateChangeEvent12: emitter.InnerEvent = {
      eventId: 2501,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent12, this.stateChangCallBack);
  }

   build() {
    Column() {
      Text('onSubmit:' + this.submitValue).fontSize(18).margin(15)
      Search({ placeholder: 'Type to search...' })
        .attributeModifier(this._SearchModifier)
        .key('search')
        .width('90%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .onSubmit((value: string): void => {
          this.submitValue = value
        })
        .margin(20)
    }.width('100%')
  }
}

