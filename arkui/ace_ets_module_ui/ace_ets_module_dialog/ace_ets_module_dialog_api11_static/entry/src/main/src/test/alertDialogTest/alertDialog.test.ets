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

import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { MeasureOptions } from '@ohos.measure'
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router, MeasureUtils } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function alertDialogCenterStartJsunit() {
  describe('alertDialogCenterStartTest', () => {
    beforeAll(() => {
      console.info("alertDialogCenterStartTest beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("alertDialogCenterStartTest  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/alertDialog2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get alertDialog state pages: " + JSON.stringify(pages));
        if (!("alertDialog2" == pages.name)) {
          console.info("get alertDialog state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push alertDialog success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alertDialog page error: " + err);
      }
      // done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("alertDialogCenterStart after each called");
    });


    
    
/**
     * @tc.number   testalertDialogCenterStart0001_static
     * @tc.name     testalertDialogCenterStart0001_static
     * @tc.desc     testalertDialogCenterStart0001_static
     * @tc.level    Level.LEVEL2
     */
it('testalertDialogCenterStart0001_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('alertDialogCenterStart testalertDialogCenterStart0011 START');
      let driver = Driver.create()
      await Utils.sleep(2000);
      try {
        let event: emitter.InnerEvent = {
          eventId: 81601,
          priority: emitter.EventPriority.LOW
        }
        let callback = (eventData: emitter.EventData) => {
          console.info("testalertDialogCenterStart0001_static get event data is: " + JSON.stringify(eventData));
          expect(((eventData.data) as Record<String,RecordData>)?.['Result']).assertEqual(true);
          console.info('testalertDialogCenterStart0001_static END');
          done();
        }
        console.info("testalertDialogCenterStart0001_static click result is: " +
        JSON.stringify(inspector.sendEventByKey('CenterStartButton', 10, "")));
        emitter.on(event, callback);
      } catch (err) {
        console.info("testalertDialogCenterStart0001_static on emitter err : " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.text('button'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
    });


    
    
/**
     * @tc.number   testMeasureText0001_static
     * @tc.name     testMeasureText0001_static
     * @tc.desc     testMeasureText0001_static
     * @tc.level    Level.LEVEL2
     */
it('testMeasureText0001_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('testMeasureText0001_static start');
      await Utils.sleep(2000);
      let driver = Driver.create()
      await Utils.sleep(2000);
      try {
        let measureOptions: MeasureOptions = {
          textContent: "alertDialog-CenterStart"
        };
        let uiContext: UIContext = AppStorage.get<UIContext>('uiContent') as UIContext
        let uiContextMeasure: MeasureUtils = uiContext.getMeasureUtils();
        let width: number = uiContextMeasure.measureText(measureOptions);
        console.info("++++++++++++++++++++++" + width.toString());
        expect(width > 0).assertTrue();
        done();
      } catch (err) {
        console.info("testMeasureText0001_static err : " + JSON.stringify(err));
        done();
      }
      let button = await driver.findComponent(ON.text('button'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
    });

  })
}
