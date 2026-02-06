/**
 * Copyright (c) 2023-2025 iSoftStone Information Technology (Group) Co.,Ltd.
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webViewOnWindowNewJsunit() {
  describe('ActsAceWebViewOnWindowNewJsunitTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/onWindowNew',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get onWindowNew state success ' + JSON.stringify(pages));
        if (!('onWindowNew' == pages.name)) {
          console.info('get onWindowNew state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push onWindowNew page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push onWindowNew page error: ' + err);
      }
      await waitForComponent('onWindowNew');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('onWindowNew beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('onWindowNew afterEach start');
      console.info('onWindowNew afterEach end');
      done();
    })

    /*
    * @tc.number : SUB_ACE_BASIC_ETS_API_GETORIGINSPROMISE_0100
    * @tc.name   : testGetOriginsPromiseLoadLocalHtml01
    * @tc.desc   : test api GetOrigins promise mode by load loacal html
    * @tc.size   : MediumTest
    * @tc.type   : Function
    * @tc.level  : Level 0
    */
    it('testGetOriginsPromiseLoadLocalHtml01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOriginsPromiseLoadLocalHtml01', 137800)
        Utils.registerEvent('testGetOriginsPromiseLoadLocalHtml01', true, 137810, done);
        sendEventByKey('onWindowNew', 10, '');
      })
  })
}