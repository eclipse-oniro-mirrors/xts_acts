
/**
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
      })
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
      })
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
  private stateChangCallBack = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      console.info("Search page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.typeValue != null) {
        this._SearchModifier._testType = eventData.data?.typeValue;      
      }
      else {
        this._SearchModifier._testType = 0;    
      }
    }
  }

  onPageShow() {

    let stateChangeEvent01: events_emitter.InnerEvent = {
      eventId: 1401,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent01, this.stateChangCallBack);

    let stateChangeEvent02: events_emitter.InnerEvent = {
      eventId: 1501,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent02, this.stateChangCallBack);

     let stateChangeEvent03: events_emitter.InnerEvent = {
      eventId: 1601,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent03, this.stateChangCallBack);

    let stateChangeEvent04: events_emitter.InnerEvent = {
      eventId: 1701,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent04, this.stateChangCallBack);

    let stateChangeEvent05: events_emitter.InnerEvent = {
      eventId: 1801,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent05, this.stateChangCallBack);


    let stateChangeEvent06: events_emitter.InnerEvent = {
      eventId: 1901,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent06, this.stateChangCallBack);

     let stateChangeEvent07: events_emitter.InnerEvent = {
      eventId: 2001,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent07, this.stateChangCallBack);


    let stateChangeEvent08: events_emitter.InnerEvent = {
      eventId: 2101,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent08, this.stateChangCallBack);

    let stateChangeEvent09: events_emitter.InnerEvent = {
      eventId: 2201,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent09, this.stateChangCallBack);


    let stateChangeEvent10: events_emitter.InnerEvent = {
      eventId: 2301,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent10, this.stateChangCallBack);

     let stateChangeEvent11: events_emitter.InnerEvent = {
      eventId: 2401,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent11, this.stateChangCallBack);


    let stateChangeEvent12: events_emitter.InnerEvent = {
      eventId: 2501,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent12, this.stateChangCallBack);
  }

   build() {
    Column() {
      Text('onSubmit:' + this.submitValue).fontSize(18).margin(15)
      Search({ placeholder: 'Type to search...' })
        .attributeModifier(this._SearchModifier)
        .key('search')
        //.selectionMenuHidden(true)
        // .caretStyle({
        //   width: '1.5vp',
        //   color: '#007DFF'
        // })
        //.enableKeyboardOnFocus(false)
        //.placeholderFont({ size: 14, weight: 400 })
        // .searchIcon({
        //   size: 30,
        //   color: Color.Red
        // })
        //.searchButton('SEARCH')
        //.fontColor(Color.Red)
        //.copyOption(CopyOptions.InApp)
        //.textFont({ size: 14, weight: 400 })
        //.placeholderColor(Color.Grey)
        // .cancelButton({
        //   style: CancelButtonStyle.CONSTANT,
        // })
        //.textAlign(TextAlign.Center)
        .width('90%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .onSubmit((value: string) => {
          this.submitValue = value
        })
        .margin(20)
    }.width('100%')
  }
}

