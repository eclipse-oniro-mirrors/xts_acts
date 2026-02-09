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
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import { ComponentInfo } from './Interfaces';
import systemDateTime from '@ohos.systemDateTime';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs';
import router from '@ohos.router';
import RectValue from './Rect';

export default class Utils {
  static rect_left: number;
  static rect_top: number;
  static rect_right: number;
  static rect_bottom: number;
  static rect_value: RectValue;

  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static getSystemTime() {
    return systemDateTime.getTime(true) / 1000
  }

  static getSandboxFileDir() {
    let sandboxFileDir = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + "/"
    console.log(`[getSandboxFileDir] return ${sandboxFileDir}`);
    return sandboxFileDir;
  }

  static deleteFile(filePath: string) {
    console.info("[deleteFile] filePath:" + filePath);
    try {
      fs.unlinkSync(filePath)
    } catch (error) {
      console.info("[deleteFile] error:" + error);
    }
  }

  static isFileExist(filePath: string): boolean {
    console.info("[isFileExist] filePath:" + filePath);
    try {
      let fileExist = fs.accessSync(filePath)
      console.info("[isFileExist] return:" + fileExist);
      return fileExist
    } catch (error) {
      console.info("[isFileExist] error:" + error);
      return false
    }
  }

  static async pickerFlingComponent(key: string, isHorizontal: boolean, isForward: boolean) {
    let driver = Driver.create();
    let Picker = await driver.findComponent(ON.id(key));
    let rect = await Picker.getBounds();
    let centerX = Math.round(Utils.getRectHorizontalCenterX(rect))
    let centerY = Math.round(Utils.getRectVerticalCenterY(rect))
    let X1 =  Math.round(centerX - Math.round((centerX-rect.left)/2));
    let X2 =  Math.round(centerX + Math.round((centerX-rect.left)/2));
    let Y1 = Math.round(centerY - Math.round((centerY-rect.top)/2));
    let Y2 = Math.round(centerY + Math.round((centerY-rect.top)/2));

    let stepLen = 20;
    let speed = 10000;
    if (isHorizontal) {
      if (isForward) {
        await driver.fling({
          x: X2, y: centerY
        }, {
          x: X1, y: centerY
        }, stepLen, speed);
      } else {
        await driver.fling({
          x: X1, y: centerY
        }, {
          x: X2, y: centerY
        }, stepLen, speed);
      }
    } else {
      if (isForward) {
        await driver.fling({
          x: centerX, y: Y2
        }, {
          x: centerX, y: Y1
        }, stepLen, speed);
      } else {
        await driver.fling({
          x: centerX, y: Y1
        }, {
          x: centerX, y: Y2
        }, stepLen, speed);
      }
    }
  }

  static async flingComponent(key: string, isHorizontal: boolean, isForward: boolean) {
    let driver = Driver.create();
    let rect = Utils.getComponentRect(key);
    let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect))
    let centerY = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect))
    let X1 =  Math.round(centerX - vp2px(66.67));
    let X2 =  Math.round(centerX + vp2px(66.67));
    let Y1 = Math.round(centerY - vp2px(66.67));
    let Y2 = Math.round(centerY + vp2px(66.67));

    let stepLen = 20;
    let speed = 10000;
    if (isHorizontal) {
      if (isForward) {
        await driver.fling({
          x: X2, y: centerY
        }, {
          x: X1, y: centerY
        }, stepLen, speed);
      } else {
        await driver.fling({
          x: X1, y: centerY
        }, {
          x: X2, y: centerY
        }, stepLen, speed);
      }
    } else {
      if (isForward) {
        await driver.fling({
          x: centerX, y: Y2
        }, {
          x: centerX, y: Y1
        }, stepLen, speed);
      } else {
        await driver.fling({
          x: centerX, y: Y1
        }, {
          x: centerX, y: Y2
        }, stepLen, speed);
      }
    }
  }

  static async clickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    await component.click();
  }

  static async doubleClickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    await component.click();
    await component.click();
  }

  static async clickLocation(X: number, Y: number) {
    let driver = Driver.create();
    await driver.click(X, Y);
  }

  static async triggerKey(id: number) {
    let driver = Driver.create();
    await driver.triggerKey(id);
  }

  static async longClickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    await component.longClick();
  }

  static async clickComponentByText(text: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.text(text));
    await component.click();
  }

  static async fingerZoom(key: string, isOut: boolean) {
    let rect = Utils.getComponentRect(key);
    let centerX =  Math.round(globalThis.winLeft +  Utils.getRectHorizontalCenterX(rect))
    let centerY =  Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect))
    let fingerUpCenterY = Math.round(centerY - vp2px(66.67));
    let fingerDownCenterY = Math.round(centerY + vp2px(66.67));
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

  static registerEvent(pageTag: string, eventId: number, callBack: Function) {
    events_emitter.on({
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }, (eventData: events_emitter.EventData) => {
      console.info("Value Change CallBack");
      if (eventData != null && eventData.data != null) {
        if (pageTag == eventData.data.PAGE_TAG) {
          console.info("CallBack value:" + JSON.stringify(eventData));
          callBack(eventData.data.VALUE);
        }
      }
    })
  }

  static emitEvent(pageTag: string, emitValue: number | string | object, eventId: number) {
    try {
      let backData: events_emitter.EventData = {
        data: {
          "PAGE_TAG": pageTag,
          "VALUE": emitValue
        }
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

  static async pushPage(pageTag: string, done?: Function) {
    let options: router.RouterOptions = {
      url: `MainAbility/pages/${pageTag}`,
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info(`get ${pageTag} state success ` + JSON.stringify(pages));
      if (pageTag.indexOf(pages.name) < 0) {
        console.info(`get ${pageTag} state success ` + JSON.stringify(pages.name));
        let result = await router.pushUrl(options);
        await Utils.sleep(2000);
        console.info(`push ${pageTag} page success ` + JSON.stringify(result));
      }
    } catch (err) {
      console.error(`push ${pageTag} page error: ` + err);
    }
    if (done) {
      done();
    }
  }

  static async pushPageByParams(pageTag: string, params: object, done?: Function) {
    let options: router.RouterOptions = {
      url: `MainAbility/pages/${pageTag}`,
      params: params
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info(`get ${pageTag} state success ` + JSON.stringify(pages));
      if (pageTag.indexOf(pages.name) < 0) {
        console.info(`get ${pageTag} state success ` + JSON.stringify(pages.name));
        let result = await router.pushUrl(options);
        await Utils.sleep(2000);
        console.info(`push ${pageTag} page success ` + JSON.stringify(result));
      }
    } catch (err) {
      console.error(`push ${pageTag} page error: ` + err);
    }
    if (done) {
      done();
    }
  }

  static async replacePage(pageTag: string, done?: Function) {
    let options: router.RouterOptions = {
      url: `MainAbility/pages/${pageTag}`,
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info(`get ${pageTag} state success ` + JSON.stringify(pages));
      if (pageTag.indexOf(pages.name) < 0) {
        console.info(`get ${pageTag} state success ` + JSON.stringify(pages.name));
        let result = await router.replace(options);
        await Utils.sleep(2000);
        console.info(`replace ${pageTag} page success ` + JSON.stringify(result));
      }
    } catch (err) {
      console.error(`replace ${pageTag} page error: ` + err);
    }
    if (done) {
      done();
    }
  }

  static getComponentRect(key: string): Rect {
    let strJson = getInspectorByKey(key);
    let obj: ComponentInfo = JSON.parse(strJson);
    console.info('[getInspectorByKey] key is: ' + key);
    return Utils.getComponentRectByObj(obj);
  }

  static getComponentRectByObj(obj: ComponentInfo): Rect {
    console.info('[getInspectorByKey] current component is: ' + obj.$type);
    let rectInfo: Object[] = JSON.parse('[' + obj.$rect + ']');
    let rect_value: Rect = {
      left: JSON.parse('[' + rectInfo[0] + ']')[0],
      top: JSON.parse('[' + rectInfo[0] + ']')[1],
      right: JSON.parse('[' + rectInfo[1] + ']')[0],
      bottom: JSON.parse('[' + rectInfo[1] + ']')[1]
    };
    console.info(JSON.stringify(rect_value));
    return rect_value;
  }

  static getComponentInfoByKey(key: string): ComponentInfo {
    let strJson = getInspectorByKey(key);
    let obj: ComponentInfo = JSON.parse(strJson);
    console.info('[getInspectorByKey] current component info: ' + JSON.stringify(obj));
    return obj;
  }

  static getRectHorizontalCenterX(rect: Rect): number {
    return Number.parseInt(Number((rect.right - rect.left) / 2 + rect.left).toFixed(0));
  }

  static getRectVerticalCenterY(rect: Rect): number {
    return Number.parseInt(Number((rect.bottom - rect.top) / 2 + rect.top).toFixed(0));
  }

  static async mouseMoveTo(X: number, Y: number) {
    let driver = Driver.create();
    await driver.mouseMoveTo({
      x: X, y: Y
    });
  }

  static getDragComponentRect(key: string) {
    let strJson: string = getInspectorByKey(key);
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
    console.info("[getInspectorByKey] rectInfo is: " + JSON.parse('[' + JSON.parse(strJson).$rect + ']'));
    Utils.rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0]
    Utils.rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1]
    Utils.rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0]
    Utils.rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1]
    return Utils.rect_value = {
      left: Utils.rect_left, top: Utils.rect_top, right: Utils.rect_right, bottom: Utils.rect_bottom
    }
  }

  static async drag(downX: number, downY: number, upX: number, upY: number, steps: number) {
    console.info('start to drag')
    Utils.drags(downX, downY, upX, upY, steps, true)
  }

  static async drags(downX: number, downY: number, upX: number, upY: number, steps: number, drag: boolean) {
    let xStep: number;
    let yStep: number;
    let swipeSteps: number;
    let ret: boolean;
    xStep = 0;
    yStep = 0;
    ret = false;
    swipeSteps = steps;
    if (swipeSteps == 0) {
      swipeSteps = 1;
    }
    xStep = (upX - downX) / swipeSteps;
    yStep = (upY - downY) / swipeSteps;
    console.info('move step is: ' + 'xStep: ' + xStep + '    yStep: ' + yStep)
    let downPonit: TouchObject = {
      id: 1,
      x: downX,
      y: downY,
      type: TouchType.Down,
      screenX: 0,
      screenY: 0,
      windowX: 0,
      windowY: 0,
      displayX: 0,
      displayY: 0
    }
    console.info('down touch started: ' + JSON.stringify(downPonit))
    sendTouchEvent(downPonit);
    console.info('start to move')
    if (drag) {
      await Utils.sleep(500)
    }
    for (let i = 1; i <= swipeSteps; i++) {
      let movePoint: TouchObject = {
        id: 1,
        x: downX + (xStep * i),
        y: downY + (yStep * i),
        type: TouchType.Move,
        screenX: 0,
        screenY: 0,
        windowX: 0,
        windowY: 0,
        displayX: 0,
        displayY: 0
      }
      console.info('move touch started: ' + JSON.stringify(movePoint))
      ret = sendTouchEvent(movePoint)
      if (ret == false) {
        break;
      }
      await Utils.sleep(5)
    }
    console.info('start to up')
    if (drag) {
      await Utils.sleep(100)
    }
    let upPoint: TouchObject = {
      id: 1,
      x: upX,
      y: upY,
      type: TouchType.Up,
      screenX: 0,
      screenY: 0,
      windowX: 0,
      windowY: 0,
      displayX: 0,
      displayY: 0
    }
    console.info('up touch started: ' + JSON.stringify(upPoint))
    sendTouchEvent(upPoint)
    await Utils.sleep(500)
  }
}
