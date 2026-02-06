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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';

export default function datePickerDialogModeTest() {
  describe('DatePickerDialogMode', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerDialog/DatePickerDialogMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DatePickerDialog state success ' + JSON.stringify(pages));
        if (!('DatePickerDialogMode' == pages.name)) {
          console.info('get DatePickerDialog state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push DatePickerDialogMode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DatePickerDialog page error ' + JSON.stringify(err));
      }
      done()
    });

     /**
      * @tc.name   DatePickerDialog_0010
      * @tc.number DatePickerDialog0100
      * @tc.desc   createDatePickerDialogModeToWindow
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('DatePickerDialog_0010', Level.LEVEL1, async (done: Function) => {
        let tagName = 'DatePickerDialog_0010';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        sendEventByKey('DatePickerDialog_001',10,"")
        await Utils.sleep(1000);
        let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker1 =JSON.stringify(obj1.$children[1].$children[0].$children[0].$children[1].$children[0])
        console.info("[DatePickerDialog_0010] obj1 is: " + datePicker1);
        console.info("[DatePickerDialog_0010] obj1 is: " + JSON.stringify(JSON.parse(datePicker1).$attrs.constructor.mode));
        expect(JSON.parse(datePicker1).$attrs.constructor.mode).assertEqual('DatePickerMode.DATE');
        console.info('[' + tagName + '] END ===========================');
        sendEventByKey('DatePickerDialog_001',10,"")
        await Utils.sleep(2000);
        done();
      });
  
      /**
       * @tc.name   DatePickerDialog_0020
       * @tc.number DatePickerDialog0200
       * @tc.desc   createDatePickerDialogModeToWindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('DatePickerDialog_0020', Level.LEVEL1, async (done: Function) => {
        let tagName = 'DatePickerDialog_0020';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        sendEventByKey('DatePickerDialog_002',10,"")
        await Utils.sleep(1000);
        let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker2 =JSON.stringify(obj2.$children[1].$children[0].$children[0].$children[1].$children[0])
        console.info("[DatePickerDialog_0020] obj2 is: " + datePicker2);
        console.info("[DatePickerDialog_0020] obj2 is: " + JSON.stringify(JSON.parse(datePicker2).$attrs.constructor.mode));
        expect(JSON.parse(datePicker2).$attrs.constructor.mode).assertEqual('DatePickerMode.YEAR_AND_MONTH');
        console.info('[' + tagName + '] END ===========================');
        sendEventByKey('DatePickerDialog_002',10,"")
        await Utils.sleep(2000);
        done();
      });
  
      /**
       * @tc.name   DatePickerDialog_0030
       * @tc.number DatePickerDialog0300
       * @tc.desc   createDatePickerDialogModeToWindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('DatePickerDialog_0030', Level.LEVEL1, async (done: Function) => {
        let tagName = 'DatePickerDialog_0030';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        sendEventByKey('DatePickerDialog_003',10,"")
        await Utils.sleep(1000);
        let obj3: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker3 =JSON.stringify(obj3.$children[1].$children[0].$children[0].$children[1].$children[0])
        console.info("[DatePickerDialog_0030] obj3 is: " + datePicker3);
        console.info("[DatePickerDialog_0030] obj3 is: " + JSON.stringify(JSON.parse(datePicker3).$attrs.constructor.mode));
        expect(JSON.parse(datePicker3).$attrs.constructor.mode).assertEqual('DatePickerMode.MONTH_AND_DAY');
        console.info('[' + tagName + '] END ===========================');
        await Utils.sleep(1000);
        sendEventByKey('DatePickerDialog_003',10,"")
        await Utils.sleep(2000);
        done();
      });
  
      /**
       * @tc.name   DatePickerDialog_0040
       * @tc.number DatePickerDialog0400
       * @tc.desc   createDatePickerDialogModeToWindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('DatePickerDialog_0040', Level.LEVEL1, async (done: Function) => {
        let tagName = 'DatePickerDialog_0040';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        sendEventByKey('DatePickerDialog_004',10,"")
        await Utils.sleep(1000);
        let obj4: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker4 =JSON.stringify(obj4.$children[1].$children[0].$children[0].$children[1].$children[0])
        console.info("[DatePickerDialog_0040] obj4 is: " + datePicker4);
        console.info("[DatePickerDialog_0040] obj4 is: " + JSON.stringify(JSON.parse(datePicker4).$attrs.constructor.mode));
        expect(JSON.parse(datePicker4).$attrs.constructor.mode).assertEqual('DatePickerMode.DATE');
        console.info('[' + tagName + '] END ===========================');
        sendEventByKey('DatePickerDialog_004',10,"")
        await Utils.sleep(2000);
        done();
      });
  
      /**
       * @tc.name   DatePickerDialog_0050
       * @tc.number DatePickerDialog0500
       * @tc.desc   createDatePickerDialogModeToWindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('DatePickerDialog_0050', Level.LEVEL1, async (done: Function) => {
        let tagName = 'DatePickerDialog_0050';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        sendEventByKey('DatePickerDialog_005',10,"")
        await Utils.sleep(1000);
        let obj5: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker5 =JSON.stringify(obj5.$children[1].$children[0].$children[0].$children[1].$children[0])
        console.info("[DatePickerDialog_0050] obj5 is: " + datePicker5);
        console.info("[DatePickerDialog_0050] obj5 is: " + JSON.stringify(JSON.parse(datePicker5).$attrs.constructor.mode));
        expect(JSON.parse(datePicker5).$attrs.constructor.mode).assertEqual('DatePickerMode.DATE');
        console.info('[' + tagName + '] END ===========================');
        sendEventByKey('DatePickerDialog_005',10,"")
        await Utils.sleep(2000);
        done();
      });
  
      /**
       * @tc.name   DatePickerDialog_0060
       * @tc.number DatePickerDialog0600
       * @tc.desc   createDatePickerDialogModeToWindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('DatePickerDialog_0060', Level.LEVEL1, async (done: Function) => {
        let tagName = 'DatePickerDialog_0060';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        sendEventByKey('DatePickerDialog_006',10,"")
        await Utils.sleep(1000);
        let obj6: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker6 =JSON.stringify(obj6.$children[1].$children[0].$children[0].$children[1].$children[0])
        console.info("[DatePickerDialog_0060] obj6 is: " + datePicker6);
        console.info("[DatePickerDialog_0060] obj6 is: " + JSON.stringify(JSON.parse(datePicker6).$attrs.constructor.mode));
        expect(JSON.parse(datePicker6).$attrs.constructor.mode).assertEqual('DatePickerMode.DATE');
        console.info('[' + tagName + '] END ===========================');
        await Utils.sleep(1000);
        sendEventByKey('DatePickerDialog_006',10,"")
        await Utils.sleep(2000);
        done();
      });
  
      /**
       * @tc.name   DatePickerDialog_0070
       * @tc.number DatePickerDialog0700
       * @tc.desc   createDatePickerDialogModeToWindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('DatePickerDialog_0070', Level.LEVEL1, async (done: Function) => {
        let tagName = 'DatePickerDialog_0070';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        sendEventByKey('DatePickerDialog_007',10,"")
        await Utils.sleep(1000);
        let obj7: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker7 =JSON.stringify(obj7.$children[1].$children[0].$children[0].$children[1].$children[0])
        console.info("[DatePickerDialog_0070] obj7 is: " + datePicker7);
        console.info("[DatePickerDialog_0070] obj7 is: " + JSON.stringify(JSON.parse(datePicker7).$attrs.constructor.mode));
        expect(JSON.parse(datePicker7).$attrs.constructor.mode).assertEqual('DatePickerMode.DATE');
        console.info('[' + tagName + '] END ===========================');
        sendEventByKey('DatePickerDialog_007',10,"")
        await Utils.sleep(2000);
        done();
      });
    })
}
