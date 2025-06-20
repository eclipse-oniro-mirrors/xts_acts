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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webConfigCookieCharacter() {

  describe('webConfigCookieCharacterTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webConfigCookieCharacter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webConfigCookieCharacter state success ' + JSON.stringify(pages));
        if (!('webConfigCookieCharacter' == pages.name)) {
          console.info('get webConfigCookieCharacter state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push webConfigCookieCharacter page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webConfigCookieCharacter page error: ' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info('webConfigCookieCharacter beforeEach start');
      done();
    })

    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIE_CHARACTER_0100
     * @tc.name       : testConfigCookieCharacter001
     * @tc.desc       : test configCookie \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieCharacter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCharacter001', 10);
      Utils.registerBaseEvent('testConfigCookieCharacter001', 'a=b', 2025060401, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIE_CHARACTER_0200
     * @tc.name       : testConfigCookieCharacter002
     * @tc.desc       : test configCookie \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieCharacter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCharacter002', 10);
      Utils.registerBaseEvent('testConfigCookieCharacter002', '17100005', 2025060402, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIE_CHARACTER_0300
     * @tc.name       : testConfigCookieCharacter003
     * @tc.desc       : test configCookie \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieCharacter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCharacter003', 10);
      Utils.registerBaseEvent('testConfigCookieCharacter003', 'a=b', 2025060403, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIE_CHARACTER_0400
     * @tc.name       : testConfigCookieCharacter004
     * @tc.desc       : test configCookie \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieCharacter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCharacter004', 10);
      Utils.registerBaseEvent('testConfigCookieCharacter004', 'a=b', 2025060404, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_CHARACTER_0100
     * @tc.name       : testConfigCookieIncludeHttpOnlyCharacter001
     * @tc.desc       : test configCookie includeHttpOnly \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieIncludeHttpOnlyCharacter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyCharacter001', 10);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyCharacter001', 'a=b,HttpOnly', 2025060405, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_CHARACTER_0200
     * @tc.name       : testConfigCookieIncludeHttpOnlyCharacter002
     * @tc.desc       : test configCookie includeHttpOnly \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieIncludeHttpOnlyCharacter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyCharacter002', 10);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyCharacter002', '17100005', 2025060406, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_CHARACTER_0300
     * @tc.name       : testConfigCookieIncludeHttpOnlyCharacter003
     * @tc.desc       : test configCookie includeHttpOnly \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieIncludeHttpOnlyCharacter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyCharacter003', 10);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyCharacter003', 'a=b,HttpOnly', 2025060407, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCLUDEHTTPONLY_CHARACTER_0400
     * @tc.name       : testConfigCookieIncludeHttpOnlyCharacter004
     * @tc.desc       : test configCookie includeHttpOnly \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieIncludeHttpOnlyCharacter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyCharacter004', 10);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyCharacter004', 'a=b,HttpOnly', 2025060408, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIE_CALLBACK_CHARACTER_0100
     * @tc.name       : testConfigCookieCallbackCharacter001
     * @tc.desc       : test configCookie callback \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieCallbackCharacter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallbackCharacter001', 10);
      Utils.registerBaseEvent('testConfigCookieCallbackCharacter001', 'a=b', 2025060409, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCOGNITO_CHARACTER_0100
     * @tc.name       : testConfigCookieIncognitoCharacter001
     * @tc.desc       : test configCookie incognito \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieIncognitoCharacter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncognitoCharacter001', 10);
      Utils.registerBaseEvent('testConfigCookieIncognitoCharacter001', 'a=b', 2025060410, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })
    /*
     * @tc.number     : SUB_WEB_CONFIGCOOKIE_INCOGNITO_INCLUDEHTTPONLY_CHARACTER_0100
     * @tc.name       : testConfigCookieIncognitoIncludeHttpOnlyCharacter001
     * @tc.desc       : test configCookie incognito includeHttpOnly \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConfigCookieIncognitoIncludeHttpOnlyCharacter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncognitoIncludeHttpOnlyCharacter001', 10);
      Utils.registerBaseEvent('testConfigCookieIncognitoIncludeHttpOnlyCharacter001', 'a=b,HttpOnly', 2025060411, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webConfigCookieCharacterButton', 10, '');
    })

  })
}
