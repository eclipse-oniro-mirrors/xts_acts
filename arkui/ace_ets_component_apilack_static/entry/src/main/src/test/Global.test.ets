'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import {
  $r,
  Area,
  BaseEvent,
  Color,
  EventTarget,
  KeyEvent,
  KeySource,
  KeyType,
  MouseAction,
  MouseButton,
  MouseEvent,
  Position,
  SourceTool,
  SourceType,
} from '@ohos.arkui.component'
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import { IntentionCode } from '@ohos.multimodalInput.intentionCode'
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
import { sendKeyEvent, sendMouseEvent } from "@ohos.arkui.Test";

import RectValue from './RectValue.test';

export default function globalJsunit() {
  describe('globalJsunit', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("global beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/global',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get global state pages:" + JSON.stringify(pages));
        if (!("global" == pages.name)) {
          console.info("get global state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push global page error:" + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
    });

    
    
    
    /**
     * @tc.number   testglobal_getInspectorTree_static_0001
     * @tc.name     testglobal_getInspectorTree_static_0001
     * @tc.desc     testglobal_getInspectorTree_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testglobal_getInspectorTree_static_0001', Level.LEVEL0, async () => {
      console.info('testglobal_getInspectorTree0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorTree();
      console.info("[testglobal_getInspectorTree0001] strJson:" + strJson);
      expect(strJson !== null).assertTrue();

    });

    
    
    
    /**
     * @tc.number   testglobal_sendKeyEvent_static_0002
     * @tc.name     testglobal_sendKeyEvent_static_0002
     * @tc.desc     testglobal_sendKeyEvent_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testglobal_sendKeyEvent_static_0002', Level.LEVEL0, async () => {
      console.info('testglobal_sendKeyEvent0002 START');
      await Utils.sleep(2000);
      let KeyEvent: KeyEvent = {
        type: KeyType.Up,
        keyCode: 2027,
        keyText: "Unknown",
        keySource: KeySource.Unknown,
        deviceId: 7,
        metaKey: 0,
        timestamp: 5284417765376,
        intentionCode: IntentionCode.INTENTION_UNKNOWN,
        stopPropagation: () => {
        },
        getModifierKeyState: (keys: Array<string>): boolean => {
          console.info("the key 0 is :" + keys[0]);
          return true;
        }
      };
      let result = sendKeyEvent(KeyEvent);
      console.info("[testglobal_sendKeyEvent0002] result:" + result);
      expect(result.toString()).assertEqual("true");

    });

    
    
    
    /**
     * @tc.number   testglobal_sendMouseEvent_static_0003
     * @tc.name     testglobal_sendMouseEvent_static_0003
     * @tc.desc     testglobal_sendMouseEvent_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testglobal_sendMouseEvent_static_0003', Level.LEVEL0, async () => {
      console.info('testglobal_sendMouseEvent0003 START');
      await Utils.sleep(2000);
      let rect = Utils.getComponentRect('ListItem');
      let mouseEvent: MouseEvent = {
        button: MouseButton.Left,
        action: MouseAction.Hover,
        // displayX: rect.left + (rect.right - rect.left) / 2, // 组件中心点x坐标,
        // displayY: rect.top + (rect.bottom - rect.top) / 2, // 组件中心点y坐标,
        // windowY: rect.top + (rect.bottom - rect.top) / 2, // 组件中心点y坐标,
        // windowX: rect.left + (rect.right - rect.left) / 2, // 组件中心点x坐标
        windowX: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的水平方向坐标
        windowY: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的垂直方向坐标
        displayX: rect.left + (rect.right - rect.left) / 2, // 相对于设备屏幕左上角的水平方向坐标
        displayY: rect.left + (rect.right - rect.left) / 2, // 相对于设备屏幕左上角的垂直方向坐标
        x: 34,
        y: 34,
        // screenX: 202.66666666666666,// 废弃
        // screenY: 102.66666666666667,// 废弃
        timestamp: new Long(8261302454000),
        target: {
          area: {
            width: 142.66666666666666,
            height: 58.666666666666664,
            position: {
              x: 158.66666666666666,
              y: 58.666666666666664,
            } as Position,
            globalPosition: {
              x: 168.66666666666666,
              y: 68.66666666666666,
            } as Position
          } as Area
        } as EventTarget,
        source: SourceType.Mouse,
        pressure: 1,
        tiltX: 1,
        tiltY: 1,
        sourceTool: SourceTool.Unknown,
        stopPropagation: () => {
        },
        getModifierKeyState: (keys: Array<string>): boolean => {
          console.info("the key 0 is :" + keys[0]);
          return true;
        }
      }
      let result = sendMouseEvent(mouseEvent);
      console.info("[testglobal_sendMouseEvent0003] result:" + result);
      expect(JSON.stringify(result)).assertEqual("true");
    });
  })
}