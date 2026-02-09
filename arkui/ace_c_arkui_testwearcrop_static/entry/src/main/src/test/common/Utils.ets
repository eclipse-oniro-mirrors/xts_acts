'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import { ComponentInfo } from './Interfaces';
import systemDateTime from '@ohos.systemDateTime';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export class RectValue {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
}

export default class Utils {
  static async sleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }


//
//   static getSystemTime() {
//     return systemDateTime.getTime(true) / 1000
//   }
//
//
  static getComponentInfoByKey(key: string) {
    let strJson = inspector.getInspectorByKey(key);
    let obj = JSON.parseJsonElement(strJson);
    console.info('[getInspectorByKey] current component info: ' + JSON.stringify(obj));
    return obj;
  }
//
//
//   static async flingComponent(key: string, isHorizontal: boolean, isForward: boolean) {
//     let driver = Driver.create();
//     let rect = Utils.getComponentRect(key);
//     let centerX = Utils.getRectHorizontalCenterX(rect)
//     let centerY = Utils.getRectVerticalCenterY(rect)
//     let X1 = centerX - 100;
//     let X2 = centerX + 100;
//     let Y1 = centerY - 100;
//     let Y2 = centerY + 100;
//     let stepLen = 20;
//     let speed = 10000;
//     if (isHorizontal) {
//       if (isForward) {
//         await driver.fling({
//           x: X2, y: centerY
//         }, {
//           x: X1, y: centerY
//         }, stepLen, speed);
//       } else {
//         await driver.fling({
//           x: X1, y: centerY
//         }, {
//           x: X2, y: centerY
//         }, stepLen, speed);
//       }
//     } else {
//       if (isForward) {
//         await driver.fling({
//           x: centerX, y: Y2
//         }, {
//           x: centerX, y: Y1
//         }, stepLen, speed);
//       } else {
//         await driver.fling({
//           x: centerX, y: Y1
//         }, {
//           x: centerX, y: Y2
//         }, stepLen, speed);
//       }
//     }
//   }
//
  static async clickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    await (component?.click() as Promise<void>);
  }
//
//   static async doubleClickComponent(id: string) {
//     let driver = Driver.create();
//     let component = await driver.findComponent(ON.id(id));
//     await component.click();
//     await component.click();
//   }
//
  static clickLocation(X: int, Y: int) {
    let driver =  Driver.create();
    waitForCompletion(async ()=>{await driver.click(X, Y);})
  }

  // static async triggerKey(id: number) {
  //   let driver = Driver.create();
  //   await driver.triggerKey(id);
  // }

  static async longClickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    await (component?.longClick() as Promise<void>);
  }

  static async clickComponentByText(text: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.text(text));
    await (component?.click() as Promise<void>);
  }
//
//   static async fingerZoom(key: string, isOut: boolean) {
//     let rect = Utils.getComponentRect(key);
//     let centerX = Utils.getRectHorizontalCenterX(rect)
//     let centerY = Utils.getRectVerticalCenterY(rect)
//     let fingerUpCenterY = centerY - 100;
//     let fingerDownCenterY = centerY + 100;
//     let driver: Driver = Driver.create();
//     let pointers: PointerMatrix = PointerMatrix.create(2, 3);
//     pointers.setPoint(0, 0, {
//       x: centerX, y: fingerUpCenterY - (isOut ? 40 : 120)
//     });
//     pointers.setPoint(0, 1, {
//       x: centerX, y: fingerUpCenterY - 80
//     });
//     pointers.setPoint(0, 2, {
//       x: centerX, y: fingerUpCenterY - (isOut ? 120 : 40)
//     });
//     pointers.setPoint(1, 0, {
//       x: centerX, y: fingerDownCenterY + (isOut ? 40 : 120)
//     });
//     pointers.setPoint(1, 1, {
//       x: centerX, y: fingerDownCenterY + 80
//     });
//     pointers.setPoint(1, 2, {
//       x: centerX, y: fingerDownCenterY + (isOut ? 120 : 40)
//     });
//     await driver.injectMultiPointerAction(pointers);
//   }
//
//   static registerEvent(pageTag: string, eventId: number, callBack: Function) {
//     events_emitter.on({
//       eventId: eventId,
//       priority: events_emitter.EventPriority.LOW
//     }, (eventData: events_emitter.EventData) => {
//       console.info("Value Change CallBack");
//       if (eventData != null && eventData.data != null) {
//         if (pageTag == eventData.data.PAGE_TAG) {
//           console.info("CallBack value:" + JSON.stringify(eventData));
//           callBack(eventData.data.VALUE);
//         }
//       }
//     })
//   }
//
//   static emitEvent(pageTag: string, emitValue: number | string | object, eventId: number) {
//     try {
//       let backData: events_emitter.EventData = {
//         data: {
//           "PAGE_TAG": pageTag,
//           "VALUE": emitValue
//         }
//       }
//       let backEvent: events_emitter.InnerEvent = {
//         eventId: eventId,
//         priority: events_emitter.EventPriority.LOW
//       }
//       console.info("start to emit page state");
//       events_emitter.emit(backEvent, backData);
//     } catch (err) {
//       console.info("emit page state err: " + JSON.stringify(err));
//     }
//   }
//
  static async pushPage(pageTag: string, done?: boolean) {
    let router:Router = AppStorage.get<Router>('router') as Router

    let options: router.RouterOptions = {
      url: `pages/${pageTag}`,
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info(`get ${pageTag} state success 196 ` + JSON.stringify(pages));
      if (pageTag.indexOf(pages.name) < 0) {
        console.info(`get ${pageTag} state success 198 ` + JSON.stringify(pages.name));
        router.pushUrl(options);
        console.info(`get ${pageTag} push success 200 :` + JSON.stringify(pages.name));
        await Utils.sleep(2000);
      }
    } catch (err) {
      console.error(`push ${pageTag} page error 204: ` + err);
    }
    if (done) {
    }
  }

  static getComponentRect(key: string) {
    let strJson = inspector.getInspectorByKey(key);
    let obj = JSON.parseJsonElement(strJson);
    console.info('[getInspectorByKey] key is: ' + key);
    return Utils.getComponentRectByObj(obj);
  }

  static getComponentRectByObj(obj: jsonx.JsonElement): RectValue {
    console.info('[getInspectorByKey] current component is: ' + obj.getElement("$type"));
    const str = obj.getString("$rect")
    let parts = str.substring(1, str.length - 1).split("],[");
    let rectInfo = parts.map((part: string) => {
      return part.split(",").map((item: string):double => parseFloat(item.trim()));
    });
    console.info("windowRect Left: " + AppStorage.get<number>("winLeft") + ',' +
      "windowRect Top: " + AppStorage.get<number>("winTop"));
    return {
      "left": Number(rectInfo[0][0] ?? 0),
      "top": Number(rectInfo[0][1] ?? 0),
      "right": Number(rectInfo[1][0] ?? 0),
      "bottom": Number(rectInfo[1][1] ?? 0)
    } as RectValue
  }

//   static getRectHorizontalCenterX(rect: Rect): number {
//     return Number.parseInt(Number((rect.right - rect.left) / 2 + rect.left).toFixed(0));
//   }
//
//   static getRectVerticalCenterY(rect: Rect): number {
//     return Number.parseInt(Number((rect.bottom - rect.top) / 2 + rect.top).toFixed(0));
//   }
//
//   static async mouseMoveTo(X: number, Y: number) {
//     let driver = Driver.create();
//     await driver.mouseMoveTo({
//       x: X, y: Y
//     });
//   }
//
//   static async mouseMoveToCurrentComponent(componentId: string) {
//     let driver = Driver.create();
//     let component = await driver.findComponent(ON.id(componentId));
//     let point = await component.getBounds();
//     await driver.mouseMoveTo({
//       x: point.left + 10, y: point.bottom - 10
//     });
//   }
}