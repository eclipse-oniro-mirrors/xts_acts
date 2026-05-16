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

import events_emitter from '@ohos.events.emitter';
import RectValue from './Rect'
import inspector from '@ohos.arkui.inspector'
import { RecordData } from '@ohos.base';

export default class Utils {
  static rect_left: number;
  static rect_top: number;
  static rect_right: number;
  static rect_bottom: number;
  static rect_value: RectValue = new RectValue();

  static async sleep(time: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        console.info(`sleep ${time} over...`)
        resolve(0)
      }, time)
    })
  }

  static sendEvent(message: string, eventId: int) {
    let eventData: events_emitter.EventData = {
      data: {
        "msg": message
      } as Record<String,RecordData>
    }
    let event: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(event, eventData)
  }

  //获取组件所占矩形区域坐标
  static getComponentRect(key: string) {
    let strJson: string = inspector.getInspectorByKey(key);
    let obj: Record<string, Object> =
      JSON.parse<Object>(strJson, Class.from<String>()) as Record<string, Object>;
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
    let rectInfo: Array<Array<number>> =
      JSON.parse<Object>('[' + obj["$rect"]! + ']', Class.from<String>()) as Array<Array<number>>;
    console.info("[getInspectorByKey] rectInfo is: " + rectInfo);
    Utils.rect_left = Number(rectInfo[0][0] ?? 0);
    Utils.rect_top = Number(rectInfo[0][1] ?? 0);
    Utils.rect_right = Number(rectInfo[1][0] ?? 0);
    Utils.rect_bottom = Number(rectInfo[1][1] ?? 0);
    return Utils.rect_value = {
      left: Utils.rect_left,
      top: Utils.rect_top,
      right: Utils.rect_right,
      bottom: Utils.rect_bottom
    }
  }
}