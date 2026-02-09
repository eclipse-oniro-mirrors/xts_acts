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
import { AttrsManager } from './AttrsManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {Color,Length, TouchType, KeyType, MouseButton, MouseAction, AlignRuleOption, focusControl, KeySource, SourceTool, SourceType, SweepGradientOptions } from '@ohos.arkui.component';
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import pointer from '@ohos.multimodalInput.pointer';
import { sendTouchEvent, sendKeyEvent, sendMouseEvent } from "@ohos.arkui.Test";
import { IntentionCode } from '@ohos.multimodalInput.intentionCode';
import { TouchObject, KeyEvent, MouseEvent } from '@ohos.arkui.component';

export class RectValue {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
}
export class SetValue {
  height: Length = 0;
  useEffect: boolean;
}
export class ExpectValue {
  width: Length = 0
  height: Length = 0
  heightCompare: string = ''
  ExceedParent: boolean = false;
  useEffect: boolean;
}
export class ShadowOptions1 {
  radius: string = '';
  color: string = '';
  offsetX: string = '';
  offsetY: string = '';
  type: string = '';
  fill: string = '';
}
export class RouterParams {
  view: PageConfig = new PageConfig()
}

export class TestValue {
  describe: string = '';
  setValue: SetValue = new SetValue();
  exceptView: string = '';
  expectValue:ExpectValue=new ExpectValue()
}

export class BasePageConfig {
  pageConfig: PageConfig = new PageConfig();
  testValue: TestValue = new TestValue();
  caseTag: string = '';
  customParams?: Object;
  viewObj?: jsonx.JsonElement;
}

export class PageConfig {
  BackGroundColor: Color = Color.Red
  parentBackGroundColor: string = ''
  childWidth: number
  childHeight: number
  parentHeight: number
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  parentWidth: number = 0;
  subassemblyWidth: number = 0;
  subassemblyHeight: number = 0;
  subassemblyCenter: AlignRuleOption = {};
  parentComponentKey: string = '';
  referenceComponentKey: string = '';
  targetView: string = '';
  testValue: TestValue = new TestValue();
  componentKey?: string = '';
  sharePage?: boolean;
  containerView?: string;
  targetGroupView: string = '';
  compareTextKey: string = '';
  compareTextWidth: number;
  compareTextHeight: number;
  scrollWidth: number;
  scrollHeight: number;
  columnWidth: number;
  columnHeight: number;
  buttonWidth: number;
  buttonHeight: number;
  componentWidth: number;
  componentHeight: number;
  columns: number;
  gutter: number;
  targetComponentHeight: number;
  targetComponentWidth: number;
}

export default class Utils {
  public static instance: Utils = new Utils();

  static sleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static getStringFromFile(fileName: string): Promise<string> {
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
      let pageParams: RouterParams = router.getParams() as RouterParams;
      console.info('get ' + obj.pageName + ' state pages: ' + JSON.stringify(pages));
      if (pageParams && pageParams.view && obj.targetView != pageParams.view.targetView) {
        console.info('get ' + obj.pageName + ' params: ' + JSON.stringify(pageParams));
        console.info('pageParams.view.targetView: ' + pageParams.view.targetView);
        console.info('targetView: ' + obj.targetView);
        await Utils.back();
        pages = router.getState();
      }

      if (!(obj.pageName == pages.name)) {
        console.info('get ' + obj.pageName + ' state pages.name:' + JSON.stringify(pages.name));
        router.pushUrl({
          url: obj.pageUrl,
          params: {
            view: obj
          } as RouterParams
        });
        await Utils.sleep(2000);
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

  // static getComponentRectByObj(obj: ESObject): RectValue {
  //   console.info('[getInspectorByKey] current component is: ' + obj.$type);
  //   let rectInfo: ESObject = JSON.parse('[' + obj.$rect + ']');
  //   let rect_value: RectValue = {
  //     left: Number(JSON.parse('[' + rectInfo[0] + ']')[0]),
  //     top: Number(JSON.parse('[' + rectInfo[0] + ']')[1]),
  //     right: Number(JSON.parse('[' + rectInfo[1] + ']')[0]),
  //     bottom: Number(JSON.parse('[' + rectInfo[1] + ']')[1])
  //   };
  //   console.info(JSON.stringify(rect_value));
  //   return rect_value;
  // }

  static getComponentByKey(componentKey: string): jsonx.JsonElement {
    let strJson = inspector.getInspectorByKey(componentKey);
    let strObj = JSON.parseJsonElement(strJson)
    console.info('[' + componentKey + '] obj is: ' + String(strObj));
    return strObj;
  }

  static getRectHorizontalCenterX(rect: RectValue) {
    (rect.right - rect.left) / 2 + rect.left;
  }

  static getRectVerticalCenterY(rect: RectValue) {
    (rect.bottom - rect.top) / 2 + rect.top;
  }
}