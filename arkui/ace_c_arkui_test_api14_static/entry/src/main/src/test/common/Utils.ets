'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import { Driver, ON, PointerMatrix, Rect, Component, Point } from '@ohos.UiTest';
import { ComponentInfo } from './Interfaces';
import inspector from '@ohos.arkui.inspector';
import systemDateTime from '@ohos.systemDateTime';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs';
import RectValue from './Rect'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

export default class Utils {
  static async sleep(count: int): Promise<int> {
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
    static getComponentInfoByKey(key: string): jsonx.JsonElement {
      let strJson = inspector.getInspectorByKey(key);
      let obj: jsonx.JsonElement = JSON.parseJsonElement(strJson);
      console.info('[inspector.getInspectorByKey] current component info: ' + JSON.stringify(obj));
      return obj;
    }


  static async flingComponent(key: string, isHorizontal: boolean, isForward: boolean) {
    let driver = Driver.create();
    let strJson = inspector.getInspectorByKey(key);
    let obj = JSON.parseJsonElement(strJson);
    let rect = Utils.getComponentRectByObj(obj);
    let centerX = (Utils.getRectHorizontalCenterX(rect)).toInt()
    let centerY = (Utils.getRectVerticalCenterY(rect)).toInt()
    let X1 = centerX - 100;
    let X2 = centerX + 100;
    let Y1 = centerY - 100;
    let Y2 = centerY + 100;
    let stepLen: Int = 20;
    let speed = 10000;
    if (isHorizontal) {
      if (isForward) {
        await driver.fling({
          x: X2, y: centerY
        } as Point, {
          x: X1, y: centerY
        } as Point, stepLen, speed);
      } else {
        await driver.fling({
          x: X1, y: centerY
        } as Point, {
          x: X2, y: centerY
        } as Point, stepLen, speed);
      }
    } else {
      if (isForward) {
        await driver.fling({
          x: centerX, y: Y2
        } as Point, {
          x: centerX, y: Y1
        } as Point, stepLen, speed);
      } else {
        await driver.fling({
          x: centerX, y: Y1
        } as Point, {
          x: centerX, y: Y2
        } as Point, stepLen, speed);
      }
    }
  }

  //
  static async clickComponent(id: string) {
    let driver = Driver.create();
    let component: Component = await driver.findComponent(ON.id(id)) as Component;
    await component.click();
  }

  static async pushPageByParams(pageTag: string, params: object, done?: () => void) {
    let options: router.RouterOptions = {
      url: `MainAbility/pages/${pageTag}`,
      params: params
    }
    try {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.clear();
      let pages = routerInstance.getState();
      console.info(`get ${pageTag} state success ` + JSON.stringify(pages));
      if (pageTag.indexOf(pages.name) < 0) {
        console.info(`get ${pageTag} state success ` + JSON.stringify(pages.name));
        // let result = await router.pushUrl(options);
        await Utils.sleep(2000);
        // console.info(`push ${pageTag} page success ` + JSON.stringify(result));
      }
    } catch (err) {
      console.error(`push ${pageTag} page error: ` + err);
    }
    if (done) {
      done();
    }
  }

  //
  //   static async doubleClickComponent(id: string) {
  //     let driver = Driver.create();
  //     let component = await driver.findComponent(ON.id(id));
  //     await component.click();
  //     await component.click();
  //   }
  //
  //   static async clickLocation(X: number, Y: number) {
  //     let driver = Driver.create();
  //     await driver.click(X, Y);
  //   }
  //
  static async triggerKey(id: Int) {
    let driver = Driver.create();
    await driver.triggerKey(id);
  }

  //
  static async longClickComponent(id: string) {
    let driver = Driver.create();
    let component: Component = await driver.findComponent(ON.id(id)) as Component;
    await component.longClick();
  }

  //
  //   static async clickComponentByText(text: string) {
  //     let driver = Driver.create();
  //     let component = await driver.findComponent(ON.text(text));
  //     await component.click();
  //   }
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
  static registerEvent(pageTag: string, eventId: Long, callBack: (data: number) => void) {
    events_emitter.on({
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    } as events_emitter.InnerEvent, (eventData: events_emitter.EventData) => {
      console.info("Value Change CallBack");
      const data = eventData!.data as Record<String,RecordData>
      if (eventData != null && data != null) {
        if (pageTag == data['PAGE_TAG'] as string) {
          console.info("CallBack value:" + JSON.stringify(eventData));
          callBack(data['VALUE'] as number);
        }
      }
    })
  }

  //
  static emitEvent(pageTag: string, emitValue: number | string | object, eventId: Long) {
    try {
      let backData: events_emitter.EventData = {
        data: {
          "PAGE_TAG": pageTag,
          "VALUE": emitValue
        } as Record<String,RecordData>
      }
      let backEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("start to emit page state");
      events_emitter.emit(backEvent, backData);
    } catch (err) {
      console.info("emit page state err: " + JSON.stringify(err));
    }
  }

  //
  static async pushPage(pageTag: string, done?: boolean) {
    let router: Router = AppStorage.get<Router>('router') as Router

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


    static getComponentRect(key: string): RectValue {
      let strJson = inspector.getInspectorByKey(key);
      let obj: jsonx.JsonElement = JSON.parseJsonElement(strJson);
      console.info('[inspector.getInspectorByKey] key is: ' + key);
      return Utils.getComponentRectByObj(obj);
    }

  static getComponentRectByObj(obj: jsonx.JsonElement): RectValue {
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

  static getRectHorizontalCenterX(rect: RectValue): number {
    return Number.parseInt(Number((rect.right - rect.left) / 2 + rect.left).toFixed(0));
  }

  //
  static getRectVerticalCenterY(rect: RectValue): number {
    return Number.parseInt(Number((rect.bottom - rect.top) / 2 + rect.top).toFixed(0));
  }

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