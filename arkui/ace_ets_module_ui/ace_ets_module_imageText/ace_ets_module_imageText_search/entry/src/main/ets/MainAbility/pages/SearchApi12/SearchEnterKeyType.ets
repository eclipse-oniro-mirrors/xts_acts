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

class SearchEnterKeyTypeModifier  implements AttributeModifier<SearchAttribute> {
    enterKeyType: EnterKeyType | undefined = undefined;
    applyNormalAttribute(instance: SearchAttribute): void {
      instance.enterKeyType( this.enterKeyType );
    }
  }

@Entry
@Component
struct SearchEnterKeyType {   
  @State  enterKeyType: EnterKeyType | undefined = undefined;
  @State SearchEnterKeyTypeModifier: SearchEnterKeyTypeModifier = new SearchEnterKeyTypeModifier()

  private stateChangCallBack = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      console.info("SearchEnterKeyTypeModifier page state change called:" + JSON.stringify(eventData));

      if (eventData.data?.enterKeyType != null) {
        console.info("[SearchEnterKeyTypeModifier page] enterKeyType change data is " + eventData.data?.enterKeyType);
        this.enterKeyType = eventData.data?.enterKeyType;
        this.SearchEnterKeyTypeModifier.enterKeyType =  eventData.data?.enterKeyType;
      }
    }
  }  

  onPageShow() {
    for( let i = 0; i < 8; i++)
    {
      let eventid:number = 810 + i;
      let stateChangeEvent: events_emitter.InnerEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    }
  }  
  
  build() {
    Column() {
      Search({ value: 'Search EnterKeyType default.' })
        .height('5%')
        .id('key_search_enterkeytype_default')

      Search({ value: 'Search EnterKeyType set.' })
        .border({ width: 1 }).padding(10).height('5%')
        .attributeModifier( this.SearchEnterKeyTypeModifier )
        .id('key_search_enterkeytype')
    }
  }
}