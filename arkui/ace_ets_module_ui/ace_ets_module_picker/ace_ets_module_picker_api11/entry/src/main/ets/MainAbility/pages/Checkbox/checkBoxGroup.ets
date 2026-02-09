/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../../common/Log';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../../test/Utils'

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct CheckBoxGroupPart {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear CheckBoxGroupPart start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear CheckBoxGroupPart end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("checkBoxGroup-Part")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("PartText")

      Text("checkBoxGroup-Group")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("groupText")

      CheckboxGroup({ group: 'checkboxGroup' })
        .key('CheckboxGroup')
        .selectedColor(0xed6f21)
        .onChange((itemName: CheckboxGroupResult) => {
          console.info("TextPicker::dialogResult is" + JSON.stringify(itemName))
          console.info("TextPicker::dialogResult is" + JSON.stringify(itemName.status))
          try {
            let backData: events_emitter.EventData = {
              data: {
                "STATUS": itemName.status
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60301,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("Part start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("Part emit action state err: " + JSON.stringify((err as Error).message))
          }
          Utils.sleep(1000);
          if (itemName.status === SelectStatus.Part) {
            console.info("CheckboxGroup SelectStatus.Part")
          }
        })
      Text('select all').fontSize(20)
      Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
        .key('Checkbox1')
        .select(true)
        .selectedColor(0xed6f21)
        .onChange((value: boolean) => {
          console.info('Checkbox1 change is' + value)
        })
      Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
        .key('Checkbox2')
        .select(false)
        .selectedColor(0x39a2db)
        .onChange((value: boolean) => {
          console.info('Checkbox2 change is' + value)
        })
    }
    .width("100%")
    .height("100%")
  }
}

