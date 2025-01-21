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

import router from '@system.router';
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'
import RectValue from '../../MainAbility/common/Rect';

export default function globalJsunit1() {
  describe('globalJsunit1', () => {
    beforeEach(async () => {
      console.info("global beforeEach start");
      let options = {
        uri: 'MainAbility/pages/global/global1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get global state pages:" + JSON.stringify(pages));
        if (!("global1" == pages.name)) {
          console.info("get global state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push global page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push global page error:" + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testglobal_getInspectorTree0001
     * @tc.desic         aceGlobal_getInspectorTree0001
     */
    it('testglobal_getInspectorTree0001', 0, async () => {
      console.info('testglobal_getInspectorTree0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorTree();
      console.info("[testglobal_getInspectorTree0001] strJson:" + strJson);
      expect(strJson !== null).assertTrue();

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testglobal_sendKeyEvent0002
     * @tc.desic         aceGlobal_sendKeyEvent0002
     */
    it('testglobal_sendKeyEvent0002', 0, async () => {
      console.info('testglobal_sendKeyEvent0002 START');
      await Utils.sleep(2000);
      let KeyEvent: KeyEvent = {
        type: 1,
        keyCode: 2027,
        keyText: "Unknown",
        keySource: 4,
        deviceId: 7,
        metaKey: 0,
        timestamp: 5284417765376,
        intentionCode: -1,
        stopPropagation: () => {
        },
        getModifierKeyState: (keys: Array<string>): boolean => {
          console.info("the key 0 is :" + keys[0]);
          return true;
        }
      };
      let result = sendKeyEvent(KeyEvent);
      console.info("[testglobal_sendKeyEvent0002] result:" + result);
      expect(JSON.stringify(result)).assertEqual("true");

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testglobal_sendMouseEvent0003
     * @tc.desic         aceGlobal_sendMouseEvent0003
     */
    it('testglobal_sendMouseEvent0003', 0, async () => {
      console.info('testglobal_sendMouseEvent0003 START');
      await Utils.sleep(2000);
      let rect: RectValue = Utils.getComponentRect('ListItem');
      let mouseEvent: MouseEvent = {
        button: 0,
        action: 3,
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
        screenX: 202.66666666666666,
        screenY: 102.66666666666667,
        timestamp: 8261302454000,
        target: {
          area: {
            width: 142.66666666666666,
            height: 58.666666666666664,
            position: {
              x: 158.66666666666666,
              y: 58.666666666666664,
            },
            globalPosition: {
              x: 168.66666666666666,
              y: 68.66666666666666,
            }
          }
        },
        source: 1,
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