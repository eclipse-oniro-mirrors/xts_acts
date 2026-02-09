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


let storage1: LocalStorage = LocalStorage.GetShared()
let storage2: LocalStorage = new LocalStorage({ 'PropA': 47 } as Record<string, number>);

@Entry(storage1)
@Component
struct StateManagementGetShared {
  @LocalStorageLink('storageSimpleProp') simpleVarName: number = 0

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text(`Parent from LocalStorage ${this.simpleVarName}`).height('5%')
        .key('GetSharedText')
        .onClick(() => {
          try {
            let backDataOne: events_emitter.EventData = {
              data: {
                'Result': (storage1 != null)
              }
            }
            let backEventOne: events_emitter.InnerEvent = {
              eventId: 60223,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('GetShared start to emit action state')
            events_emitter.emit(backEventOne, backDataOne)
          } catch (err) {
            console.info('GetShared emit action state err: ' + JSON.stringify((err as Error)?.message))
          }
        })

      Text(`Parent from LocalStorage ${this.simpleVarName}`).height('5%')
        .key('setAndLinkText')
        .onClick(() => {
          try {
            let backDataTwo: events_emitter.EventData = {
              data: {
                'Result': 'callback2'
              }
            }
            let backEventTwo: events_emitter.InnerEvent = {
              eventId: 60224,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('setAndLink start to emit action state')
            events_emitter.emit(backEventTwo, backDataTwo)
          } catch (err) {
            console.info('setAndLink emit action state err: ' + JSON.stringify((err as Error)?.message))
          }
          // storage1.setAndLink('storageSimpleProp',48)
          // console.log('storage1.setAndLink('PropA',48) :' + this.simpleVarName )
        })

      Text(`Parent from LocalStorage ${this.simpleVarName}`).height('5%')
        .key('setOrCreateText')
        .onClick(() => {
          try {
            let backDataThree: events_emitter.EventData = {
              data: {
                'Result': 'callback3'
              }
            }
            let backEventThree: events_emitter.InnerEvent = {
              eventId: 60225,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('setOrCreate start to emit action state')
            events_emitter.emit(backEventThree, backDataThree)
          } catch (err) {
            console.info('setOrCreate emit action state err: ' + JSON.stringify((err as Error)?.message))
          }
          // storage1.setOrCreate('storageSimpleProp',47)
          // console.log('storageSimpleProp setOrCreate is :  ' + this.simpleVarName)
        })

      Text(`Parent from LocalStorage ${this.simpleVarName}`).height('5%')
        .key('setAndPropText')
        .onClick(() => {
          try {
            let backDataFour: events_emitter.EventData = {
              data: {
                'Result': 'callback4'
              }
            }
            let backEventFour: events_emitter.InnerEvent = {
              eventId: 60226,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('setAndProp start to emit action state')
            events_emitter.emit(backEventFour, backDataFour)
          } catch (err) {
            console.info('setAndProp emit action state err: ' + JSON.stringify((err as Error)?.message))
          }

          // storage1.setAndProp('storageSimpleProp',49)
          //console.log('storageSimpleProp setAndProp is :  ' + this.simpleVarName)
        })

    }.width('100%').height('100%')
  }
}

@Component
struct Child {
  @LocalStorageLink('PropA') storLink: number = 1;

  build() {
    Text(`Parent from LocalStorage ${this.storLink}`).height('5%')
      .onClick(() => this.storLink += 1)
  }
}
