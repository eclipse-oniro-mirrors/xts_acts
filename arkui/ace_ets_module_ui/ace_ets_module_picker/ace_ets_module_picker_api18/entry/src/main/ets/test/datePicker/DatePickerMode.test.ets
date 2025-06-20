/**
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';

export default function datePickerMode() {
  describe('DatePickerMode', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePicker/DatePickerMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DatePicker state success ' + JSON.stringify(pages));
        if (!('DatePickerMode' == pages.name)) {
          console.info('get DatePicker state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push DatePickerMode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DatePicker page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
    * @tc.number    DatePicker0100
    * @tc.name      DatePicker0100
    * @tc.desc      createDatePickerModeToWindow
    * @tc.level:    Level 2
    * @tc.type :
    * @tc.size :
    */
    it('DatePicker0100', Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_DatePicker_001');
      console.info('[' + tagName + '] Search end is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .constructor.mode));
      expect(JSON.parse(strJsonNew).$attrs.constructor.mode).assertEqual('DatePickerMode.DATE');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
    * @tc.number    DatePicker0200
    * @tc.name      DatePicker0200
    * @tc.desc      createDatePickerModeToWindow
    * @tc.level:    Level 2
    * @tc.type :
    * @tc.size :
    */
    it('DatePicker0200', Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker0200';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_DatePicker_002');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .constructor.mode));
      expect(JSON.parse(strJsonNew).$attrs.constructor.mode).assertEqual('DatePickerMode.YEAR_AND_MONTH');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
    * @tc.number    DatePicker0300
    * @tc.name      DatePicker0300
    * @tc.desc      createDatePickerModeToWindow
    * @tc.level:    Level 2
    * @tc.type :
    * @tc.size :
    */
    it('DatePicker0300', Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker0300';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_DatePicker_003');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .constructor.mode));
      expect(JSON.parse(strJsonNew).$attrs.constructor.mode).assertEqual('DatePickerMode.MONTH_AND_DAY');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
    * @tc.number    DatePicker0400
    * @tc.name      DatePicker0400
    * @tc.desc      createDatePickerModeToWindow
    * @tc.level:    Level 2
    * @tc.type :
    * @tc.size :
    */
    it('DatePicker0400', Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker0400';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_DatePicker_004');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .constructor.mode));
      expect(JSON.parse(strJsonNew).$attrs.constructor.mode).assertEqual('DatePickerMode.DATE');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
    * @tc.number    DatePicker0500
    * @tc.name      DatePicker0500
    * @tc.desc      createDatePickerModeToWindow
    * @tc.level:    Level 2
    * @tc.type :
    * @tc.size :
    */
    it('DatePicker0500', Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker0500';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_DatePicker_005');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .constructor.mode));
      expect(JSON.parse(strJsonNew).$attrs.constructor.mode).assertEqual('DatePickerMode.DATE');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
   * @tc.number    DatePicker0600
   * @tc.name      DatePicker0600
   * @tc.desc      createDatePickerModeToWindow
   * @tc.level:    Level 2
   * @tc.type :
   * @tc.size :
   */
    it('DatePicker0600', Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker0600';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_DatePicker_006');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .constructor.mode));
      expect(JSON.parse(strJsonNew).$attrs.constructor.mode).assertEqual('DatePickerMode.DATE');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
    * @tc.number    DatePicker0700
    * @tc.name      DatePicker0700
    * @tc.desc      createDatePickerModeToWindow
    * @tc.level:    Level 2
    * @tc.type :
    * @tc.size :
    */
    it('DatePicker0700', Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker0700';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_DatePicker_007');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .constructor.mode));
      expect(JSON.parse(strJsonNew).$attrs.constructor.mode).assertEqual('DatePickerMode.DATE');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
