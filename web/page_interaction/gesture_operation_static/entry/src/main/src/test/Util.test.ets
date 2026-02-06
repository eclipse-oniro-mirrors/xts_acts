/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { ComponentInfo, RectInfo } from './Interfaces';
import { Driver, ON, PointerMatrix, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import emitter from '@ohos.events.emitter';
import { expect } from "../../../hypium/index";
import { RecordData } from '@ohos.base';

export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async clickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    if (component != null) {
      await component.click();
    }
  }

  static async clickComponentText(text: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.text(text));
    if (component != null) {
      await component.click();
    }
  }

  static async emitEvent(actualValue: boolean | string | Int | object, eventId: Int) {
    try {
      console.info("Entry emitEvent, actualValue = " + actualValue);
      const tempData: Record<string, RecordData> = {
        "ACTION": actualValue
      };
      let backData: emitter.EventData = {
        data: tempData
      }

      let backEvent: emitter.InnerEvent = {
        eventId: eventId,
        priority: emitter.EventPriority.LOW
      }
      const actionValue = (backData.data as Record<string, RecordData>)["ACTION"];
      console.info("webFlag start to emit action state, ackData.data[\"ACTION\"] = " + String(actionValue));
      emitter.emit(backEvent, backData);
      await Utils.msSleep(2000)
    } catch (err) {
      console.info("webFlag emit action state err: " + JSON.stringify(err));
    }
  }

  static registerBaseEvent(testCaseName: string, expected: Object, eventId: Int,
    done: () => void, expectFunction: (backData: emitter.EventData, expected: Object) => void) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: emitter.EventData) => {
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expectFunction(backData, expected);
          console.info(`[${testCaseName}] END`);
        } catch (err) {
          console.info(`[${testCaseName}] err:` + JSON.stringify(err));
        }
        done()
      }
      let innerEvent: emitter.InnerEvent = {
        eventId: eventId,
        priority: emitter.EventPriority.LOW
      }
      emitter.on(innerEvent, callBack)
      console.info("Finish registerBaseEvent, innerEvent.eventId=" + innerEvent.eventId + ",innerEvent.priority=" +
      innerEvent.priority);
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
  }

  static registerEvent(testCaseName: string, expectedValue: Object, eventId: Int, done: () => void) {
    Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done,
      (backData: emitter.EventData, expected: Object) => {
        const data = backData?.data as Record<string, RecordData>;
        const action = data['ACTION'];
        console.info(`Begin to assert [${action}] Equal [${expected}]`);
        expect(action).assertEqual(expected);
      });
  }

  static async fingerZoom(key: string, isOut: boolean) {
    let rect = Utils.getComponentRect(key);
    let centerX = Utils.getRectHorizontalCenterX(rect)
    let centerY = Utils.getRectVerticalCenterY(rect)
    let fingerUpCenterY = centerY - 100;
    let fingerDownCenterY = centerY + 100;
    let driver: Driver = Driver.create();
    let pointers: PointerMatrix = PointerMatrix.create(2, 3);
    pointers.setPoint(0, 0, {
      x: centerX, y: fingerUpCenterY - (isOut ? 40 : 120)
    });
    pointers.setPoint(0, 1, {
      x: centerX, y: fingerUpCenterY - 80
    });
    pointers.setPoint(0, 2, {
      x: centerX, y: fingerUpCenterY - (isOut ? 120 : 40)
    });
    pointers.setPoint(1, 0, {
      x: centerX, y: fingerDownCenterY + (isOut ? 40 : 120)
    });
    pointers.setPoint(1, 1, {
      x: centerX, y: fingerDownCenterY + 80
    });
    pointers.setPoint(1, 2, {
      x: centerX, y: fingerDownCenterY + (isOut ? 120 : 40)
    });
    await driver.injectMultiPointerAction(pointers);
  }

  static getComponentRect(key: string): RectInfo {
    let strJson: string = inspector.getInspectorByKey(key);
    //let strJson: string = getInspectorByKey(key);
    let obj: ComponentInfo = JSON.parse<ComponentInfo>(strJson, Type.of(new ComponentInfo()))!;
    console.info('[getInspectorByKey] key is: ' + key);
    return Utils.getComponentRectByObj(obj);
  }

  static getRectHorizontalCenterX(rect: RectInfo): int {
    return Number.parseInt(Number((rect.right - rect.left) / 2 + rect.left).toFixed(0)) as Int;
  }

  static getRectVerticalCenterY(rect: RectInfo): int {
    return Number.parseInt(Number((rect.bottom - rect.top) / 2 + rect.top).toFixed(0)) as Int;
  }

  static getComponentRectByObj(obj: ComponentInfo): RectInfo {
    console.info('[getInspectorByKey] current component is: ' + obj.$type);
    let rectInfo: Object[] = JSON.parse<Object[]>('[' + obj.$rect + ']', Type.of([] as Object[]))!;
    let rect_value: RectInfo = {
      left: (JSON.parse<number[]>('[' + rectInfo[0] + ']', Type.of([] as number[]))!)[0],
      top: (JSON.parse<number[]>('[' + rectInfo[0] + ']', Type.of([] as number[]))!)[1],
      right: (JSON.parse<number[]>('[' + rectInfo[1] + ']', Type.of([] as number[]))!)[0],
      bottom: (JSON.parse<number[]>('[' + rectInfo[1] + ']', Type.of([] as number[]))!)[1]
    } as RectInfo;
    console.info(JSON.stringify(rect_value));
    return rect_value;
  }

  static async pinchInComponent(id: string) {
    let driver: Driver = Driver.create();
    let image = (await driver.findComponent(ON.id(id)));
    if (image) {
      await image.pinchIn(0.5);
    }
  }
}

