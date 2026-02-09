'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { AttrsManager, GrowValue } from './AttrsManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { TouchType, KeyType, MouseButton, MouseAction, AlignRuleOption, focusControl, KeySource, SourceTool, SourceType,MouseEvent } from '@ohos.arkui.component';
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import pointer from '@ohos.multimodalInput.pointer';
import { sendTouchEvent, sendKeyEvent, sendMouseEvent } from "@ohos.arkui.Test";
import { IntentionCode } from '@ohos.multimodalInput.intentionCode';
import { jsonx } from "std/core";

export class RectValue {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
}

export class RouterParams {
  view: PageConfig = new PageConfig()
}
interface EM {
  flexGrow: number;
}
export class TestValue {
  describe: string = '';
  setValue: GrowValue = {
    parentWidth: 0,
    parentHeight: 0,
    flexShrink: 0,
    standardFlexShrink: 0,
    compareFlexShrink: 0,
  };
  exceptView: string = '';
  expectValue: EM = {
    flexGrow: 0,
  };
}
export class BasePageConfig {
  pageConfig: PageConfig = new PageConfig();
  testValue: TestValue = new TestValue();
  caseTag: string = '';
  customParams?: Object;
  viewObj?: jsonx.JsonElement;
}

export class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  compareWidth: number = 0;
  compareHeight: number = 0;
  standardWidth: number = 0;
  standardHeight: number = 0;
  standardComponentKey: string = '';
  compareComponentKey: string = '';
  targetWidth: number = 0;
  targetHeight: number = 0;
  parentWidth: number = 0;
  parentHeight: number = 0;
  subassemblyWidth: number = 0;
  subassemblyHeight: number = 0;
  subassemblyCenter: AlignRuleOption = {};
  parentComponentKey: string = '';
  referenceComponentKey: string = '';
  targetView: string = '';
  testValue: TestValue = new TestValue();
  componentKey: string = '';
  sharePage?: boolean;
  containerView?: string;
}

export default class Utils {
  public static instance: Utils = new Utils();

  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time.toInt());
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  static async getStringFromFile(fileName: string): Promise<string> {
    const abilityContext = AppStorage.get<common.Context>("abilityContext") as common.Context
    const fileData: Uint8Array = await abilityContext.resourceManager.getRawFileContent(fileName);
    return new Promise<string>((resolve, reject) => {
      if (fileData) {
        let result = '';
        for (let i = 0; i < fileData.length; i++) {
          result += String.fromCharCode(fileData[i]);
        }
        resolve(result);
      } else {
        reject(new Error(''))
      }
    })
  }

  static async pushPage(obj: PageConfig) {
    try {
      const router = AppStorage.get<Router>("router") as Router
      let pages = router.getState();
      let pageParams = JSON.parseJsonElement(JSON.stringify(router.getParams()));
      console.info('get ' + obj.pageName + ' state pages: ' + JSON.stringify(pages));
      if (pageParams && pageParams.tryGetElement('view') && obj.targetView != pageParams.getElement('view').getString('targetView')) {
        console.info('get ' + obj.pageName + ' params: ' + JSON.stringifyJsonElement(pageParams));
        console.info('pageParams.view.targetView: ' + pageParams.getElement('view').getString('targetView'));
        console.info('targetView: ' + obj.targetView);
        await Utils.back();
        pages = router.getState();
      }

      if (obj.pageName != pages.name || obj.targetView != pageParams.getElement('view').getString('targetView')) {
        console.info('get ' + obj.pageName + ' state pages.name:' + JSON.stringify(pages.name));
        router.pushUrl({
          url: obj.pageUrl,
          params: {
            view: obj
          } as RouterParams
        });
        await Utils.sleep(500);
        console.info('push ' + obj.pageName);
      }
    } catch (err) {
      console.error('push ' + obj.pageName + ' page error:' + err);
    }
  }

  static async back() {
    const router = AppStorage.get<Router>("router") as Router
    if (!('Index' == router.getState().name)) {
      router.back()
    }
    AttrsManager.unRegisterDataChange();
    await Utils.sleep(1000);
    router.clear();
  }

  static async backOnly() {
    const router = AppStorage.get<Router>("router") as Router
    router.back()
    await Utils.sleep(1000);
  }

  static getComponentRect(key: string): RectValue {
    let strJson = inspector.getInspectorByKey(key);
    let obj1 = JSON.parseJsonElement(strJson)
    const str = obj1.getString("$rect")
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

  static getComponentRectByObj(obj: jsonx.JsonElement): RectValue {
    console.info('[getInspectorByKey] current component is: ' + obj.getElement("$type"));
    // let rectInfo = JSON.parseJsonElement('[' + obj.getElement('$rect') + ']');
    let rectInfo: Array<Array<number>> = JSON.parse<Object>('[' + obj["$rect"]! + ']', Class.from<String>()) as Array<Array<number>>;
    console.info("[getInspectorByKey] rectInfo is: " + rectInfo);
    let rect_value: RectValue = {
      left:Number(rectInfo[0][0] ?? 0),
      top:Number(rectInfo[0][1] ?? 0),
      right:Number(rectInfo[1][0] ?? 0),
      bottom:Number(rectInfo[1][1] ?? 0),
    };
    console.info(JSON.stringify(rect_value));
    return rect_value;
  }

  static getComponentByKey(componentKey: string): jsonx.JsonElement {
    let strJson = inspector.getInspectorByKey(componentKey);
    console.info('[' + componentKey + '] obj is: ' + JSON.stringify(JSON.parseJsonElement(strJson)));
    return JSON.parseJsonElement(strJson);
}

  static getRectHorizontalCenterX(rect: RectValue) {
    (rect.right - rect.left) / 2 + rect.left;
  }

  static getRectVerticalCenterY(rect: RectValue) {
    (rect.bottom - rect.top) / 2 + rect.top;
  }

  static requestFocus(id: string): boolean {
    console.info('requestFocus id : ' + id);
    let result = focusControl.requestFocus(id);
    console.info('requestFocus result : ' + result);
    return result;
  }

  static performClick(id: string): boolean {
    console.info('performClick id : ' + id);
    let result = inspector.sendEventByKey(id, 10, '');
    console.info('performClick result : ' + result);
    return result
  }

  static async performClickPoint(x: number, y: number) {
    Utils.performTouch(x, y, x, y, TouchType.Down);
    await Utils.sleep(100);
    Utils.performTouch(x, y, x, y, TouchType.Up);
  }

  static performTouchDownUp(id: string): boolean {
    let down = Utils.performTouchComponentCenter(id, TouchType.Down)
    if (down) {
      let up = Utils.performTouchComponentCenter(id, TouchType.Up)
      return up
    }

    return false;
  }

  static performTouchComponentCenter(id: string, type: TouchType): boolean {
    console.info('performTouchComponent id : ' + id);
    return Utils.performTouchRectCenter(0, 0, Utils.getComponentRect(id), type);
  }

  static performTouchRectCenter(rootX: number, rootY: number, rect: RectValue, type: TouchType): boolean {
    console.info('performTouchRectCenter parentX : ' + rootX);
    console.info('performTouchRectCenter parentY : ' + rootY);
    console.info('performTouchRectCenter rect.left : ' + rect.left);
    console.info('performTouchRectCenter rect.top : ' + rect.top);
    console.info('performTouchRectCenter rect.right : ' + rect.right);
    console.info('performTouchRectCenter rect.bottom : ' + rect.bottom);

    let screenX = (rect.right + rect.left) * 0.5;
    let screenY = (rect.bottom + rect.top) * 0.5;
    let x = (rect.right + rect.left) * 0.5 - rootX;
    let y = (rect.bottom + rect.top) * 0.5 - rootY;

    return Utils.performTouch(screenX, screenY, x, y, type);
  }

  static performTouch(screenX: number, screenY: number, x: number, y: number, type: TouchType): boolean {
    console.info('performTouch type : ' + type);
    console.info('performTouch screenX : ' + screenX);
    console.info('performTouch screenY : ' + screenY);
    console.info('performTouch x : ' + x);
    console.info('performTouch y : ' + y);

    let result = sendTouchEvent({
      windowX: screenX,
      windowY: screenX,
      displayX: screenX,
      displayY: screenX,
      type: type,
      id: 0,
      x: x,
      y: y,
    })

    console.info('performTouch result : ' + result);

    return result;
  }

  static performKeyEventDownUp(keyCode: Int, keyText: string): boolean {
    let down = Utils.performKeyEvent(KeyType.Down, keyCode, keyText)
    if (down) {
      let up = Utils.performKeyEvent(KeyType.Up, keyCode, keyText)
      return up
    }

    return false;
  }

  static performKeyEvent(type: KeyType, keyCode: Int, keyText: string): boolean {
    console.info('performKeyEvent type : ' + type);
    console.info('performKeyEvent keyCode : ' + keyCode);
    console.info('performKeyEvent keyText : ' + keyText);

    let result = sendKeyEvent({
      type: type,
      keyCode: keyCode,
      keyText: keyText,
      intentionCode: IntentionCode.INTENTION_UNKNOWN,
      keySource: KeySource.Keyboard,
      deviceId: 0,
      metaKey: 0,
      timestamp: new Date().getTime() as long,
      stopPropagation: () => {
      },
      getModifierKeyState:(keys: Array<string>):boolean => {
        console.info("the key 0 is :" + keys[0]);
        return true;
      }
    })
    console.info('performKeyEvent result : ' + result);
    return result
  }

  static performMouseEvent(id: string, button: MouseButton, action: MouseAction): boolean {
    console.info('performMouseEvent id : ' + id);
    console.info('performMouseEvent button : ' + button);
    console.info('performMouseEvent action : ' + action);

    let targetComponentRect = Utils.getComponentRect(id);
    let screenX = (targetComponentRect.right + targetComponentRect.left) * 0.5;
    let screenY = (targetComponentRect.bottom + targetComponentRect.top) * 0.5;
    let x = (targetComponentRect.right + targetComponentRect.left) * 0.5;
    let y = (targetComponentRect.bottom + targetComponentRect.top) * 0.5;
    let width = targetComponentRect.right - targetComponentRect.left;
    let height = targetComponentRect.bottom - targetComponentRect.top;
    console.info('performMouseEvent screenX : ' + screenX);
    console.info('performMouseEvent screenY : ' + screenY);
    console.info('performMouseEvent x : ' + x);
    console.info('performMouseEvent y : ' + y);
    console.info('performMouseEvent width : ' + y);
    console.info('performMouseEvent height : ' + y);

    let result = sendMouseEvent({
      windowX: screenX,
      windowY: screenX,
      displayX: screenX,
      displayY: screenX,
      x: x,
      y: y,
      button: button,
      action: action,
      timestamp: new Date().getTime() as long,
      target: {
        area: {
          width: width,
          height: height,
          position: {
            x: 0, y: 0
          },
          globalPosition: {
            x: 0, y: 0
          },
        }
      },
      source: SourceType.Mouse,
      tiltX: 0,
      tiltY: 0,
      sourceTool: SourceTool.Finger,
      pressure: 0,
      stopPropagation: () => {
      },
      getModifierKeyState:(keys: Array<string>):boolean => {
        console.info("the key 0 is :" + keys[0]);
        return true;
      }
    } as MouseEvent)

    console.info('performMouseEvent result : ' + result);

    return result;
  }
}