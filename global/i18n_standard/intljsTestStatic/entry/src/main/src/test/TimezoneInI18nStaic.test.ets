/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import Ability from '@ohos.app.ability.UIAbility'
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterEach,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'
import deviceInfo from '@ohos.deviceInfo'
import intl from '@ohos.intl'
import Utils from './Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function TimezoneInI18nTest() {

  describe("TimezoneInI18nTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start TimezoneInI18nTest*************');

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.name   timezone_test_static_0100
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_0100
     * @tc.desc   get the getTimeZone value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_0100 ' + 'start');
      let timezone = i18n.getTimeZone();
      let value = timezone.getID();
      console.log('timezone_test_static_0100 ' + value);
      expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name   timezone_test_static_0400
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_0400
     * @tc.desc   get the getDisplayName value, test getDisplayName method with true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_0400', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_0400 ' + 'start');
      let timezone = i18n.getTimeZone();
      let value = timezone.getDisplayName(undefined);
      console.log('timezone_test_static_0400 ' + value);
      expect(value.length > 0).assertTrue();
    })

    /**
     * @tc.name   timezone_test_static_0600
     * @tc.number timezone_test_static_0600
     * @tc.desc   test getRawOffset method get the getRawOffset value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_0600', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_0600 ' + 'start');
      let timezone = i18n.getTimeZone();
      let value = timezone.getRawOffset();
      console.log('timezone_test_static_0600 ' + value);
      expect(value >= 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_static_0700
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_0700
     * @tc.desc   get the getOffset value, test getOffset method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_0700', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_0700 ' + 'start');
      let timezone = i18n.getTimeZone();
      let value = timezone.getOffset();
      console.log('timezone_test_static_0700 ' + value);
      expect(value >= 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_static_0800
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_0800
     * @tc.desc   get the getOffset value, test getOffset method with date param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_0800', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_0800 ' + 'start');
      let timezone = i18n.getTimeZone();
      let value = timezone.getOffset(10540800000);
      console.log('timezone_test_static_0800 ' + value);
      expect(value >= 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_static_0900
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_0900
     * @tc.desc   get the getID value, test getID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_0900', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_0900 ' + 'start');
      let timezone = i18n.getTimeZone('ACT');
      let value = timezone.getID();
      console.log('timezone_test_static_0900 ' + value);
      expect(value).assertEqual('ACT');
    })
    
    /**
     * @tc.name   timezone_test_static_1000
     * @tc.number timezone_test_static_1000
     * @tc.desc   test getDisplayName with timezone id,get the getID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_1000', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_1000 ' + 'start');
      let timezone = i18n.getTimeZone('ACT');
      let value = timezone.getDisplayName();
      console.log('timezone_test_static_1000 ' + value);
      expect(value).assertEqual('澳大利亚中部标准时间');
    })

    /**
     * @tc.name   timezone_test_static_1300
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_1300
     * @tc.desc   get the getID value, test getDisplayName with en-US and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_1300', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_1300 ' + 'start');
      let timezone = i18n.getTimeZone('Asia/Shanghai');
      let value = timezone.getDisplayName('en-US', true);
      console.log('timezone_test_static_1300 ' + value);
      expect(value).assertEqual('China Standard Time');
    })
    
    /**
     * @tc.name   timezone_test_static_1400
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_1400
     * @tc.desc   get the getID value, test getDisplayName with zh-CN and false param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_1400', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_1400 ' + 'start');
      let timezone = i18n.getTimeZone('Asia/Shanghai');
      let value = timezone.getDisplayName('zh-CN', false);
      console.log('timezone_test_static_1400 ' + value);
      expect(value).assertEqual('中国标准时间');
    })

    /**
     * @tc.name   timezone_test_static_1100
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1100
     * @tc.desc   get the getID value ,test getDisplayName with locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_1100', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_1100 ' + 'start');
      let timezone = i18n.getTimeZone('Asia/Shanghai');
      let value = timezone.getDisplayName('zh-CN');
      console.log('timezone_test_static_1100 ' + value);
      expect(value).assertEqual('中国标准时间');
    })

    /**
     * @tc.name   timezone_test_static_1200
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1200
     * @tc.desc   test getDisplayName with locale get the getID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_1200', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_1200 ' + 'start');
      let timezone = i18n.getTimeZone('Asia/Shanghai');
      let value = timezone.getDisplayName('zh-CN', true);
      console.log('timezone_test_static_1200 ' + value);
      expect(value).assertEqual('中国标准时间');
    })


    /**
     * @tc.name   timezone_test_static_1500
     * @tc.number timezone_test_static_1500
     * @tc.desc   test getRawOffset method with timezone id get the getRawOffset value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_1500', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_1500 ' + 'start');
      let timezone = i18n.getTimeZone('ACT');
      let value = timezone.getRawOffset();
      console.log('timezone_test_static_1500 ' + value);
      expect(value > 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_static_1600
     * @tc.number timezone_test_static_1600
     * @tc.desc   test getOffset method with timezone id, get the getOffset value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_1600', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_1600 ' + 'start');
      let timezone = i18n.getTimeZone('ACT');
      let value = timezone.getOffset();
      console.log('timezone_test_static_1600 ' + value);
      expect(value > 0).assertEqual(true);
    })

    /**
     * @tc.name   timezone_test_static_1700
     * @tc.number timezone_test_static_1700
     * @tc.desc   test getOffset method with date and timezone id param, get the getOffset value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_1700', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_1700 ' + 'start');
      let timezone = i18n.getTimeZone('ACT');
      let value = timezone.getOffset(10540800000);
      console.log('timezone_test_static_1700 ' + value);
      expect(value > 0).assertEqual(true);
    })


    /**
     * @tc.name   timezone_test_static_1800
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1800
     * @tc.desc   test getAvailableIDs method get the getAvailableIDs value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_1800', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_1800 ' + 'start');
      let value = i18n.TimeZone.getAvailableIDs();
      console.log('timezone_test_static_1800 ' + value);
      expect(value.length > 0).assertEqual(true);
    })
    
    /**
     * @tc.name   timezone_test_static_1900
     * @tc.number timezone_test_static_1900
     * @tc.desc   test getAvailableZoneCityIDs method, get the getAvailableZoneCityIDs value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_1900', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_1900 ' + 'start');
      let value = i18n.TimeZone.getAvailableZoneCityIDs();
      console.log('timezone_test_static_1900 ' + value);
      expect(value.length > 0).assertEqual(true);
    }) 
    /**
     * @tc.name   timezone_test_static_2040
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2040
     * @tc.desc   test getCityDisplayName method with not exist cityid,get the getCityDisplayName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_2040', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_2040 ' + 'start');
      let value = i18n.TimeZone.getCityDisplayName('abcd', 'en');
      console.log('timezone_test_static_2040 ' + value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name   timezone_test_static_2060
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2060
     * @tc.desc   test getCityDisplayName method with not exist locale, get the getCityDisplayName value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_2060', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_2060 ' + 'start');
      let value = i18n.TimeZone.getCityDisplayName('Auckland', 'abc');
      console.log('timezone_test_2060 ' + value);
      expect(value).assertEqual('Auckland (New Zealand)');
    })

    /**
     * @tc.name   timezone_test_static_2100
     * @tc.number timezone_test_static_2100
     * @tc.desc   test getTimezoneFromCity method , get the getTimezoneFromCity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_2100', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_2100 ' + 'start');
      let value = i18n.TimeZone.getTimezoneFromCity('Auckland');
      console.log('timezone_test_static_2100 ' + value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name   timezone_test_static_2120
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2120
     * @tc.desc   test getTimezoneFromCity method with not exist cityid, get the getTimezoneFromCity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_2120', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_2120 ' + 'start');
      let value = i18n.TimeZone.getTimezoneFromCity('abc');
      console.log('timezone_test_static_2120 ' + value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name   timezone_test_static_2200
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2200
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_2200', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_2200 ' + 'start');
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(116, 39);
        console.log('timezone_test_static_2200 ' + value.length);
        expect(value != null).assertTrue();
        console.log('timezone_test_static_2200 ' + value[0].getID());
        expect(value[0].getID()).assertEqual('CST');
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2200 e.code' + e.code);
        console.log('timezone_test_static_2200 e.message' + e.message);
      }
    })

    /**
     * @tc.name   timezone_test_static_2300
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2300
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_static_2300', Level.LEVEL2, async (): Promise<void> => {
      console.log('timezone_test_static_2300 ' + 'start');
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(87, 43);
        console.log('timezone_test_static_2300 ' + value.length);
        expect(value != null).assertTrue();
        console.log('timezone_test_static_2300 ' + value[0].getID());
        console.log('timezone_test_static_2300 ' + value[1].getID());
        expect(value[0].getID()).assertEqual('CST');
        expect(value[1].getID()).assertEqual('CST');
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2300 e.code' + e.code);
        console.log('timezone_test_static_2300 e.message' + e.message);
      }
    })

    /**
     * @tc.name   timezone_test_static_2400
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2400
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_static_2400', Level.LEVEL2, async (): Promise<void> => {
      console.log('timezone_test_static_2400 ' + 'start');
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(-74, 40);
        console.log('timezone_test_static_2400 ' + value.length);
        expect(value != null).assertTrue();
        console.log('timezone_test_static_2400 ' + value[0].getID());
        expect(value[0].getID()).assertEqual('CST');
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2400 e.code' + e.code);
        console.log('timezone_test_static_2400 e.message' + e.message);
      }
    })

    /**
     * @tc.name   timezone_test_static_2500
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2500
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_static_2500', Level.LEVEL2, async (): Promise<void> => {
      console.log('timezone_test_static_2500 ' + 'start');
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(2, 49);
        console.log('timezone_test_static_2500 ' + value.length);
        expect(value != null).assertTrue();
        console.log('timezone_test_static_2500 ' + value[0].getID());
        expect(value[0].getID()).assertEqual('CST');
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2500 e.code' + e.code);
        console.log('timezone_test_static_2500 e.message' + e.message);
      }
    })

    /**
     * @tc.name   timezone_test_static_2600
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2600
     * @tc.desc   get the getTimezonesByLocation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('timezone_test_static_2600', Level.LEVEL2, async (): Promise<void> => {
      console.log('timezone_test_static_2600 ' + 'start');
      try {
        let value = i18n.TimeZone.getTimezonesByLocation(18, -33);
        console.log('timezone_test_static_2600 ' + value.length);
        expect(value != null).assertTrue();
        console.log('timezone_test_static_2600 ' + value[0].getID());
        expect(value[0].getID()).assertEqual('CST');
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2600 e.code' + e.code);
        console.log('timezone_test_static_2600 e.message' + e.message);
      }
    })
    
    /**
     * @tc.name   timezone_test_static_2700
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2700
     * @tc.desc   get the getTimezonesByLocation value, test getTimezonesByLocation method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_2700', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_2700 ' + 'start');
      try{
        let value = i18n.TimeZone.getTimezonesByLocation(100,90);
        console.log('timezone_test_static_2700 ' + value);
        expect(value != null).assertTrue();
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2700 e.code' + e.code);
        console.log('timezone_test_static_2700 e.message' + e.message);
        expect(e.code == 890001).assertTrue();
        expect(e.message == 'Invalid parameter, the longitude or latitude must be a valid value.').assertTrue();
      }
    })
    
    /**
     * @tc.name   timezone_test_static_2800
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2800
     * @tc.desc   get the getTimezonesByLocation value, test getTimezonesByLocation method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_2800', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_2800 ' + 'start');
      try{
        let value = i18n.TimeZone.getTimezonesByLocation(100,-90.1);
        console.log('timezone_test_static_2800 ' + value);
        expect(value != null).assertTrue();
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2800 e.code' + e.code);
        console.log('timezone_test_static_2800 e.message' + e.message);
        expect(e.code == 890001).assertTrue();
        expect(e.message == 'Invalid parameter, the longitude or latitude must be a valid value.').assertTrue();
      }
    })

    /**
     * @tc.name   timezone_test_static_2900
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_2900
     * @tc.desc   get the getTimezonesByLocation value,test getTimezonesByLocation method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_2900', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_2900 ' + 'start');
      try{
        let value = i18n.TimeZone.getTimezonesByLocation(180.0,50);
        console.log('timezone_test_static_2900 ' + value);
        expect(value != null).assertTrue();
      } catch (e: BusinessError) {
        console.log('timezone_test_static_2900 e.code' + e.code);
        console.log('timezone_test_static_2900 e.message' + e.message);
        expect(e.code == 890001).assertTrue();
        expect(e.message == 'Invalid parameter, the longitude or latitude must be a valid value.').assertTrue();
      }
    })

    /**
     * @tc.name   timezone_test_static_3000
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_3000
     * @tc.desc   get the getTimezonesByLocation value,test getTimezonesByLocation method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_3000', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_3000 ' + 'start');
      try{
        let value = i18n.TimeZone.getTimezonesByLocation(-180.1,50);
        console.log('timezone_test_static_3000 ' + value);
        expect(value != null).assertTrue();
      } catch (e: BusinessError) {
        console.log('timezone_test_static_3000 e.code' + e.code);
        console.log('timezone_test_static_3000 e.message' + e.message);
        expect(e.code == 890001).assertTrue();
        expect(e.message == 'Invalid parameter, the longitude or latitude must be a valid value.').assertTrue();
      }
    })

    /**
     * @tc.name   timezone_test_static_3100
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_3100
     * @tc.desc   get the getTimezonesByLocation value, test getTimezonesByLocation method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_3100', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_3100 ' + 'start');
      try{
        let value = i18n.TimeZone.getTimezonesByLocation(18, -77);
        console.log('timezone_test_static_3100 ' + value.length);
        expect(value != null).assertTrue();
      } catch (e: BusinessError) {
        console.log('timezone_test_static_3100 e.code' + e.code);
        console.log('timezone_test_static_3100 e.message' + e.message);
        expect(e.code == 401).assertTrue();
        expect(e.message == 'Parameter error, the longitude or latitude cannot be empty.').assertTrue();
      }
    })

    /**
     * @tc.name   timezone_test_static_3200
     * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_static_3200
     * @tc.desc   get the getTimezonesByLocation value, test getTimezonesByLocation method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timezone_test_static_3200', Level.LEVEL0, async (): Promise<void> => {
      console.log('timezone_test_static_3200 ' + 'start');
      try{
        let value = i18n.TimeZone.getTimezonesByLocation(18, 33);
        console.log('timezone_test_static_3200 ' + value.length);
        expect(value != null).assertTrue();
      } catch (e: BusinessError) {
        console.log('timezone_test_static_3200 e.code' + e.code);
        console.log('timezone_test_static_3200 e.message' + e.message);
        expect(e.code == 401).assertTrue();
        expect(e.message == 'Parameter error, the type of latitude must be number.').assertTrue();
      }
    })
    console.log('*************end TimezoneInI18nTest*************');
  })
}