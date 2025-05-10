/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { UIContext } from '@ohos.arkui.UIContext';
import { AnimatorOptions } from '@ohos.animator';

export default function stageAnimatorTest() {
  describe('stageAnimatorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/stageAnimator',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stageAnimator state success " + JSON.stringify(pages));
        if (!("stageAnimator" == pages.name)) {
          console.info("get stageAnimator state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push stageAnimator page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stageAnimator page error: " + err);
      }
      done()
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

    it('testanimatorstage0001', Level.LEVEL1, async (done: Function) => {
      console.info('testanimatorstage0001 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('animator');
          sendEventByKey("animator", 10, "")
          console.info("[testanimatorstage0001] component width strJson:" + strJson);
          expect(JSON.parse(strJson).$type).assertEqual('Button');
          expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
          console.info("[testanimatorstage0001] width value :" + JSON.parse(strJson).$attrs.width);
          console.info('testanimatorstage0001 END ');
        } catch (err) {
          expect().assertFail()
          console.info('testanimatorstage0001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('testanimatorstage0002', Level.LEVEL1, async (done: Function) => {
      let animator: UIContext = globalThis.uiContent;
      console.info('testanimatorstage0002 START');
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
        let result: ESObject = animator.createAnimator(options)
        expect(typeof (result)).assertEqual('object');
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage0002 END');
      done();
    });

    it('testanimatorstage0003', Level.LEVEL1, async (done: Function) => {
      let animator: UIContext = globalThis.uiContent;
      console.info('testanimatorstage0003 START');
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
        let result: ESObject = animator.createAnimator(options)
        expect(typeof (result)).assertEqual('object');
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage0002 END');
      done();
    });

    it('testanimatorstage0004', Level.LEVEL1, async (done: Function) => {
      let animator: UIContext = globalThis.uiContent;
      console.info('testanimatorstage0004 START');
      try {
        let options: ESObject = animator.createAnimator(null)
        expect(typeof (options)).assertEqual('object');
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage0004 END');
      done();
    });

    it('testanimatorstage0005', Level.LEVEL1, async (done: Function) => {
      let animator: UIContext = globalThis.uiContent;
      console.info('testanimatorstage0005 START');
      try {
        let options: ESObject = animator.createAnimator({
          duration: 1500,
          easing: "friction",
          delay: 0,
          fill: "none",
          direction: "normal",
          iterations: 0,
          begin: 0,
          end: 1
        })
        expect(typeof (options)).assertEqual('object');
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage0005 END');
      done();
    });

    it('testanimatorstage0006', Level.LEVEL1, async (done: Function) => {
      let animator: UIContext = globalThis.uiContent;
      console.info('testanimatorstage0006 START');
      try {
        let options: ESObject = animator.createAnimator({
          duration: 1500,
          easing: "",
          delay: 0,
          fill: "none",
          direction: "normal",
          iterations: 0,
          begin: 0,
          end: 1
        })
        expect(typeof (options)).assertEqual('object');
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage0006 END');
      done();
    });
  })
}