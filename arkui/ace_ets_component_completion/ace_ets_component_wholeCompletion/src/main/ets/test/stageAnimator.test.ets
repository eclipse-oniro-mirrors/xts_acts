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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@system.router';

export default function stageAnimatorTest() {
  describe('stageAnimatorTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/stageAnimator',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stageAnimator state success " + JSON.stringify(pages));
        if (!("stageAnimator" == pages.name)) {
          console.info("get stageAnimator state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push stageAnimator page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stageAnimator page error: " + err);
      }
      done()
    });
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('testanimatorstage0001', 0, async function (done) {
      console.info('testanimatorstage0001 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('animator');
          sendEventByKey("animator", 10, "")
          console.info("[testanimatorstage0001] component width strJson:" + strJson);
          let obj = JSON.parse(strJson);
          expect(obj.$type).assertEqual('Button');
          expect(obj.$attrs.width).assertEqual("100.00vp");
          console.info("[testanimatorstage0001] width value :" + obj.$attrs.width);
          console.info('testanimatorstage0001 END ');
        } catch(err) {
          expect().assertFail()
          console.info('testanimatorstage0001 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('testanimatorstage0002', 0, async function (done) {
      let animator = globalThis.uiContent;
      console.info('testanimatorstage0002 START');
      try {
        let options = animator.createAnimator({
          duration: 1500,
          easing: "friction",
          delay: 0,
          fill: "forwards",
          direction: "normal",
          iterations: 3,
          begin: 200,
          end: 400
        })
        expect(typeof(options)).assertEqual('object');
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage0002 END');
      done();
    });

    it('testanimatorstage0003', 0, async function (done) {
      let animator = globalThis.uiContent;
      console.info('testanimatorstage0003 START');
      try {
        let options = animator.createAnimator()
        expect(typeof(options)).assertEqual('object');
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage0002 END');
      done();
    });

    it('testanimatorstage0004', 0, async function (done) {
      let animator = globalThis.uiContent;
      console.info('testanimatorstage0004 START');
      try {
        let options = animator.createAnimator(null)
        expect(typeof(options)).assertEqual('object');
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage0004 END');
      done();
    });

    it('testanimatorstage0005', 0, async function (done) {
      let animator = globalThis.uiContent;
      console.info('testanimatorstage0005 START');
      try {
        let options = animator.createAnimator({
          duration: 1500,
          easing: "friction",
          delay: 0
        })
        expect(typeof(options)).assertEqual('object');
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage0005 END');
      done();
    });

    it('testanimatorstage0006', 0, async function (done) {
      let animator = globalThis.uiContent;
      console.info('testanimatorstage0006 START');
      try {
        let options = animator.createAnimator({
          duration: 1500
        })
        expect(typeof(options)).assertEqual('object');
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testanimatorstage0006 END');
      done();
    });


  })
}