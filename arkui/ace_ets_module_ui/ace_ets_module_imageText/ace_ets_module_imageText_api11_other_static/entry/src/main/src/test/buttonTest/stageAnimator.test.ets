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
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AnimatorOptions } from '@ohos.animator';

export default function stageAnimatorTest() {
  describe('stageAnimatorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/stageAnimator',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stageAnimator state pages:" + JSON.stringify(pages));
        if (!("stageAnimator" == pages.name)) {
          console.info("get stageAnimator pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push stageAnimator page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push stageAnimator page error: " + err);
      }

    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    //pass过 全注释
    
/**
     * @tc.number   testanimatorstage_static_0001
     * @tc.name     testanimatorstage_static_0001
     * @tc.desc     testanimatorstage_static_0001
     * @tc.level    Level.LEVEL1
     */
it('testanimatorstage_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testanimatorstage_static_0001 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('animator');
          inspector.sendEventByKey("animator", 10, "")
          console.info("[testanimatorstage_static_0001] component width strJson:" + strJson);
          expect(JSON.parseJsonElement(strJson).getElement("$type").asString()).assertEqual('Button');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("width")).assertEqual("100.00vp");
          console.info("[testanimatorstage_static_0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString("width"));
          console.info('testanimatorstage_static_0001 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('testanimatorstage_static_0001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   testanimatorstage_static_0002
     * @tc.name     testanimatorstage_static_0002
     * @tc.desc     testanimatorstage_static_0002
     * @tc.level    Level.LEVEL1
     */
it('testanimatorstage_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let animator: UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;
      console.info('testanimatorstage_static_0002 START');
      try {
        let options: AnimatorOptions = {
          duration: 1500,
          easing: "friction",
          delay: 0,
          fill: "forwards",
          direction: "normal",
          iterations: 3,
          begin: 200.0,
          end: 400.0
        };
        let result = animator.createAnimator(options)
        expect(typeof (result)).assertEqual('object');
      } catch (err:Error) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage_static_0002 END');
      done();
    });

    
/**
     * @tc.number   testanimatorstage_static_0003
     * @tc.name     testanimatorstage_static_0003
     * @tc.desc     testanimatorstage_static_0003
     * @tc.level    Level.LEVEL1
     */
it('testanimatorstage_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let animator: UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;
      console.info('testanimatorstage_static_0003 START');
      try {
        let options: AnimatorOptions = {
          duration: 0,
          easing: "",
          delay: 0,
          fill: "none",
          direction: "normal",
          iterations: 0,
          begin: 0,
          end: 1
        };
        let result = animator.createAnimator(options)
        expect(typeof (result)).assertEqual('object');
      } catch (err:Error) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage_static_0003 END');
      done();
    });

    
/**
     * @tc.number   testanimatorstage_static_0004
     * @tc.name     testanimatorstage_static_0004
     * @tc.desc     testanimatorstage_static_0004
     * @tc.level    Level.LEVEL1
     */
it('testanimatorstage_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let animator: UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;
      console.info('testanimatorstage_static_0004 START');
      try {
        // let options = animator.createAnimator(null)
        // expect(typeof (options)).assertEqual('object');
      } catch (err:Error) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage_static_0004 END');
      done();
    });

    
/**
     * @tc.number   testanimatorstage_static_0005
     * @tc.name     testanimatorstage_static_0005
     * @tc.desc     testanimatorstage_static_0005
     * @tc.level    Level.LEVEL1
     */
it('testanimatorstage_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let animator: UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;
      console.info('testanimatorstage_static_0005 START');
      try {
        let options = animator.createAnimator({
          duration: 1500,
          easing: "friction",
          delay: 0,
          fill: "none",
          direction: "normal",
          iterations: 0,
          begin: 0,
          end: 1
        } as AnimatorOptions)
        expect(typeof (options)).assertEqual('object');
      } catch (err:Error) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage_static_0005 END');
      done();
    });

    
/**
     * @tc.number   testanimatorstage_static_0006
     * @tc.name     testanimatorstage_static_0006
     * @tc.desc     testanimatorstage_static_0006
     * @tc.level    Level.LEVEL1
     */
it('testanimatorstage_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let animator: UIContext = AppStorage.get<UIContext>('uiContent') as UIContext;
      console.info('testanimatorstage_static_0006 START');
      try {
        let options = animator.createAnimator({
          duration: 1500,
          easing: "",
          delay: 0,
          fill: "none",
          direction: "normal",
          iterations: 0,
          begin: 0,
          end: 1
        } as AnimatorOptions)
        expect(typeof (options)).assertEqual('object');
      } catch (err:Error) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage_static_0006 END');
      done();
    });
  })
}