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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import ble from '@ohos.bluetooth.ble';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtBleTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let gattClientDevice: ble.GattClientDevice;
let gattServerDevice: ble.GattServer;
let g_context: common.UIAbilityContext;

export default function bluetoothBleTest() {

  describe("bluetoothBleTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      try {
        await Utils.msSleep(2000);
        hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
        g_context = Hypium.get('Context') as common.UIAbilityContext;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.ACCESS_BLUETOOTH')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
            hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
            hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
          });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
      }
      await Utils.msSleep(2000);
      await Utils.clickRequestPermission('允许');
      gattClientDevice = ble.createGattClientDevice("00:11:22:33:44:55");
      gattServerDevice = ble.createGattServer();
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    beforeEach(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach start');
      try {
        await Utils.openBluetooth();
        hilog.info(domain, tag, '%{public}s', 'beforeEach end');
      } catch (err: BusinessError) {
        hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
      }
    })

    /**
     * @tc.name   i18n_test_indexutil_static_0100
     * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_static_0100
     * @tc.desc   test getIndex interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_test_indexutil_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_indexutil_static_0100 ' + 'start');
      let index = i18n.getInstance();
      let value = index.getIndex('a');
      console.log('i18n_test_indexutil_static_0100 ' + value);
      expect(value).assertEqual('A');
    })

    /**
     * @tc.name   i18n_system_test_static_0700
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_0700
     * @tc.desc   getDisplayCountry with zh-Hans-CN and en-US and false param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_0700', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', false);
      console.log('i18n_system_test_static_0700 ' + value);
      expect(value).assertEqual('China');
    })


    /**
     * @tc.name   i18n_test_indexutil_static_0200
     * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_static_0200
     * @tc.desc   test getIndexList interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_test_indexutil_static_0200', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_test_indexutil_static_0200 ' + 'start');
      let index = i18n.getInstance();
      let value = index.getIndexList();
      let len = value.length;
      console.log('i18n_test_indexutil_static_0200 ' + value);
      expect(len>0).assertTrue();
    })

    /**
     * @tc.name   i18n_system_test_static_0800
     * @tc.number SUB_GLOBAL_i18n_SYSTEM_JS_static_0800
     * @tc.desc   getDisplayCountry with zh-Hans-CN and en-US param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_system_test_static_0800', Level.LEVEL2, async (): Promise<void> => {
      let value = i18n.System.getDisplayCountry('zh-Hans-CN', 'en-US');
      console.log('i18n_system_test_static_0800 ' + value);
      expect(value).assertEqual('China');
    })

    /**
     * @tc.name   i18n_test_indexutil_static_0300
     * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_static_0300
     * @tc.desc   test addLocale interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_test_indexutil_static_0300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_indexutil_static_0300 ' + 'start');
      let index = i18n.getInstance();
      index.addLocale('en');
      let value = index.getIndex('a');
      console.log('i18n_test_indexutil_static_0300 ' + value);
      expect(value).assertEqual('A');
    })

    /**
     * @tc.name   i18n_system_test_static_1100
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1100
     * @tc.desc   check the language, getDisplayLanguage with zh-Hans-CN and en-US and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1100', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', true);
      console.log('i18n_system_test_static_1100 ' + value);
      expect(value).assertEqual('Simplified Chinese');
    })


    /**
     * @tc.name   dateTimeFormat_test_static_0200
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0200
     * @tc.desc   format the date with zh locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let date = new Date(2021, 11, 17, 3, 24, 0);
      let datefmt = new intl.DateTimeFormat('zh');
      console.log('dateTimeFormat_test_static_0200 ' + datefmt.format(date));
      expect(datefmt.format(date)).assertContain('2021');
    })

    /**
     * @tc.name   i18n_system_test_static_1200
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1200
     * @tc.desc   check the language, getDisplayLanguage with zh-Hans-CN and en-US and undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1200', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', undefined);
      console.log('i18n_system_test_static_1200 ' + value);
      expect(value).assertEqual('Simplified Chinese');
    })

    /**
     * @tc.name   i18n_test_indexutil_static_0400
     * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_static_0400
     * @tc.desc   test getInstance interface with zh locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_test_indexutil_static_0400', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_test_indexutil_static_0400 ' + 'start');
      let index = i18n.getInstance('zh');
      let value = index.getIndex('z');
      console.log('i18n_test_indexutil_static_0400 ' + value);
      expect(value).assertEqual('Z');
    })

    /**
     * @tc.name   i18n_system_test_static_1300
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1300
     * @tc.desc   check the language, getDisplayLanguage with zh-Hans-CN and en-US and null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1300', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', undefined);
      console.log('i18n_system_test_static_1300 ' + value);
      expect(value).assertEqual('Simplified Chinese');
    })

    /**
     * @tc.name   formatNumber_test_static_1600
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1600
     * @tc.desc   check the number with scientific
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1600', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-GB', { style: 'decimal', notation: 'scientific' });
      console.log('formatNumber_test_static_1600 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('1.234568E5');
      expect(numfmt.resolvedOptions().style).assertEqual('decimal');
      expect(numfmt.resolvedOptions().notation).assertEqual('scientific');
    })

    /**
     * @tc.name   i18n_system_test_static_1700
     * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_static_1700
     * @tc.desc   check the language, getDisplayLanguage with zh-Hans and en-US and true param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_system_test_static_1700', Level.LEVEL0, async (): Promise<void> => {
      let value = i18n.System.getDisplayLanguage('zh-Hans', 'en-US', true);
      console.log('i18n_system_test_static_1700 ' + value);
      expect(value).assertEqual('Simplified Chinese');
    })



    /**
     * @tc.name   clientCloseTest
     * @tc.number clientCloseTest
     * @tc.desc   Test clientCloseTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("clientCloseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let clientDevice: ble.GattClientDevice;
      try {
        clientDevice = ble.createGattClientDevice("00:00:00:00:00:00");
        hilog.info(domain, tag, 'createGattClientDevice result:' + clientDevice);
        expect(true).assertEqual(clientDevice != null);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "createGattClientDevice get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code === 801);
        } else {
          expect().assertFail();
        }
      }
      try {
        clientDevice.close();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "clientDevice close get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code === 801);
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   transliterator_test_static_0700
     * @tc.number SUB_GLOBAL_i18n_JS_TRANSLITERATOR_static_0700
     * @tc.desc   test transform with Any-Hant param,get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_static_0700', Level.LEVEL2, async (): Promise<void> => {
      console.log('transliterator_test_static_0700 ' + 'start');
      let trans = i18n.Transliterator.getInstance('Any-Hant');
      let value = trans.transform('hello');
      console.log('transliterator_test_static_0700 ' + value);
      expect(value).assertEqual('hello');
    })

    /**
     * @tc.name   formatNumber_test_static_1700
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1700
     * @tc.desc   check the number with currency EUR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1700', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-GB', { style: 'currency', currency: 'EUR',
        currencyDisplay: 'name', currencySign: 'accounting', signDisplay: 'always' });
      console.log('formatNumber_test_static_1700 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('+123,456.79 euros');
      expect(numfmt.resolvedOptions().locale).assertEqual('en-GB');
      expect(numfmt.resolvedOptions().style).assertEqual('currency');
      expect(numfmt.resolvedOptions().currency).assertEqual('EUR');
      expect(numfmt.resolvedOptions().currencyDisplay).assertEqual('name');
      expect(numfmt.resolvedOptions().currencySign).assertEqual('accounting');
      expect(numfmt.resolvedOptions().signDisplay).assertEqual('always');
    })

    /**
     * @tc.name   transliterator_test_static_0800
     * @tc.number SUB_GLOBAL_i18n_JS_TRANSLITERATOR_static_0800
     * @tc.desc   test transform with Any-Kannada param,get the transform value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transliterator_test_static_0800', Level.LEVEL2, async (): Promise<void> => {
      console.log('transliterator_test_static_0800 ' + 'start');
      let trans = i18n.Transliterator.getInstance('Any-Kannada');
      let value = trans.transform('hello');
      console.log('transliterator_test_static_0800 ' + value);
      expect(value).assertEqual('ಹೆಲ್ಲೊ');
    })


    /**
     * @tc.name   dateTimeFormat_test_static_0120
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0120
     * @tc.desc   format the datetime with en-GB locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('dateTimeFormat_test_static_0120', Level.LEVEL2, async (): Promise<void> => {
      let datefmt = new intl.DateTimeFormat();
      expect(datefmt !== null).assertTrue();
    })

    /**
     * @tc.name   formatNumber_test_static_1800
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1800
     * @tc.desc   check the number with currency USD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1800', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('en-US', { style: 'currency', currency: 'USD',
        currencyDisplay: 'code', currencySign: 'accounting', signDisplay: 'always' });
      console.log('formatNumber_test_static_1800 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertContain('+USD');
      expect(numfmt.format(123456.789)).assertContain('123,456.79');
    })


    /**
     * @tc.name   serverCloseTest
     * @tc.number serverCloseTest
     * @tc.desc   Test serverCloseTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("serverCloseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let serverDevice:ble.GattServer;
      try {
        serverDevice = ble.createGattServer();
        hilog.info(domain, tag, 'createGattServer result:' + serverDevice);
        expect(true).assertEqual(serverDevice != null);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "createGattServer get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      try {
        serverDevice.close();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "serverDevice close get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code === 801);
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   formatNumber_test_static_1900
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_1900
     * @tc.desc   check the number with currency CNY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_1900', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh-CN', { style: 'currency', currency: 'CNY',
        currencyDisplay: 'symbol', currencySign: 'accounting', signDisplay: 'always' });
      console.log('formatNumber_test_static_1900 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('+¥123,456.79');
    })

    /**
     * @tc.name   dateTimeFormat_test_static_0100
     * @tc.number SUB_GLOBAL_INTL_JS_DATETIME_static_0100
     * @tc.desc   format the datetime with en-GB locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dateTimeFormat_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let datefmt = new intl.DateTimeFormat('en-GB');
      expect(datefmt !== null).assertTrue();
    })

    /**
     * @tc.name   formatNumber_test_static_2000
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2000
     * @tc.desc   check the number with currency JPY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2000', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('ja-JP', { style: 'currency', currency: 'JPY',
        currencyDisplay: 'narrowSymbol', currencySign: 'accounting', signDisplay: 'always' });
      console.log('formatNumber_test_static_2000 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('+￥123,457');
    })

    /**
     * @tc.name   setBLEMtuSizeTest
     * @tc.number setBLEMtuSizeTest
     * @tc.desc   Test setBLEMtuSizeTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("setBLEMtuSizeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        gattClientDevice.setBLEMtuSize(500);
        hilog.info(domain, tag, 'setBLEMtuSize success');
        expect().assertFail();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "setBLEMtuSize get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code === 801);
        } else {
          expect(true).assertEqual(err.code === 2900099);
        }
      }
      done();
    })

    /**
     * @tc.name   formatNumber_test_static_2200
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2200
     * @tc.desc   check the number with meter unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2200', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
        unitDisplay: 'long', maximumFractionDigits: 2, minimumIntegerDigits: 7 });
      console.log('formatNumber_test_static_2200 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('0,123,456.79米');
      expect(numfmt.resolvedOptions().style).assertEqual('unit');
      expect(numfmt.resolvedOptions().unit).assertEqual('meter');
      expect(numfmt.resolvedOptions().unitDisplay).assertEqual('long');
    })


    /**
     * @tc.name   collator_test_static_3600
     * @tc.number SUB_GLOBAL_INTL_JS_COLLATOR_static_3600
     * @tc.desc   compare two different strings with zh locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('collator_test_static_3600', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator('zh');
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_3600 ' + value);
      expect(value).assertEqual(-1);
    })

    /**
     * @tc.name   formatNumber_test_static_2250
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2250
     * @tc.desc   check the number with unitUsage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2250', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
        unitDisplay: 'long', unitUsage: 'length-road' });
      console.log('formatNumber_test_static_2250 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789米');
      expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /**
     * @tc.name   clientConnectDisconnectTest
     * @tc.number clientConnectDisconnectTest
     * @tc.desc   Test clientConnectDisconnectTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("clientConnectDisconnectTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        gattClientDevice.connect();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "gattClientDevice connect get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code === 801);
        } else {
          expect().assertFail();
        }
      }
      try {
        gattClientDevice.disconnect();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "gattClientDevice disconnect get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code === 801);
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   formatNumber_test_static_2260
     * @tc.number SUB_GLOBAL_INTL_JS_NUMBER_static_2260
     * @tc.desc   format the number with narrow value in unitUsage param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('formatNumber_test_static_2260', Level.LEVEL2, async (): Promise<void> => {
      let numfmt = new intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
        unitDisplay: 'narrow', unitUsage: 'length-road' });
      console.log('formatNumber_test_static_2260 ' + numfmt.format(123456.789));
      expect(numfmt.format(123456.789)).assertEqual('123,456.789米');
      expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /**
     * @tc.name   collator_test_static_3520
     * @tc.number SUB_GLOBAL_INTL_JS_COLLATOR_static_3520
     * @tc.desc   compare two different strings and return positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('collator_test_static_3520', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator();
      let value = coll.compare('b', 'a');
      console.log('collator_test_static_3200 ' + value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name   i18n_normalizer_test_static_0800
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_0800
     * @tc.desc   normalize the '0032 2075' in NFKD mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_normalizer_test_static_0800', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_0800 ' + 'start');
      let str = '\u0032\u2075';
      let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFKD);
      let value = normal.normalize(str);
      console.log('i18n_normalizer_test_static_0800 ' + value);
      expect(value).assertEqual('\u0032\u0035');
    })

    /**
     * @tc.name   bleConstantTest
     * @tc.number bleConstantTest
     * @tc.desc   Test bleConstantTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("bleConstantTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let MATCH_MODE_STICKY: ble.MatchMode = ble.MatchMode.MATCH_MODE_STICKY;
        hilog.info(domain, tag, "MATCH_MODE_STICKY:" + MATCH_MODE_STICKY);
        expect(true).assertEqual(MATCH_MODE_STICKY == 2);
        let MATCH_MODE_AGGRESSIVE: ble.MatchMode = ble.MatchMode.MATCH_MODE_AGGRESSIVE;
        hilog.info(domain, tag, "MATCH_MODE_AGGRESSIVE:" + MATCH_MODE_AGGRESSIVE);
        expect(true).assertEqual(MATCH_MODE_AGGRESSIVE == 1);
        let SCAN_MODE_LOW_POWER: ble.ScanDuty = ble.ScanDuty.SCAN_MODE_LOW_POWER;
        hilog.info(domain, tag, "SCAN_MODE_LOW_POWER:" + SCAN_MODE_LOW_POWER);
        expect(true).assertEqual(SCAN_MODE_LOW_POWER == 0);
        let WRITE: ble.GattWriteType = ble.GattWriteType.WRITE;
        hilog.info(domain, tag, "WRITE:" + WRITE);
        expect(true).assertEqual(WRITE == 1);
        let WRITE_NO_RESPONSE: ble.GattWriteType = ble.GattWriteType.WRITE_NO_RESPONSE;
        hilog.info(domain, tag, "WRITE_NO_RESPONSE:" + WRITE_NO_RESPONSE);
        expect(true).assertEqual(WRITE_NO_RESPONSE == 2);
        let STARTED: ble.AdvertisingState = ble.AdvertisingState.STARTED;
        hilog.info(domain, tag, "STARTED:" + STARTED);
        expect(true).assertEqual(STARTED == 1);
        let ENABLED: ble.AdvertisingState = ble.AdvertisingState.ENABLED;
        hilog.info(domain, tag, "ENABLED:" + ENABLED);
        expect(true).assertEqual(ENABLED == 2);
        let DISABLED: ble.AdvertisingState = ble.AdvertisingState.DISABLED;
        hilog.info(domain, tag, "DISABLED:" + DISABLED);
        expect(true).assertEqual(DISABLED == 3);
        let STOPPED: ble.AdvertisingState = ble.AdvertisingState.STOPPED;
        hilog.info(domain, tag, "STOPPED:" + STOPPED);
        expect(true).assertEqual(STOPPED == 4);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "bleConstantTest get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   i18n_normalizer_test_static_0900
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_0900
     * @tc.desc   test the getInstance error code, getInstance method return 401 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_normalizer_test_static_0900', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_0900 ' + 'start');
      let str = '\u0032\u2075';
      try{
        let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFC);
      } catch (error: BusinessError) {
        console.log('i18n_normalizer_test_static_0900 ' + error.code);
        console.log('i18n_normalizer_test_static_0900 ' + error.message);
        expect(error.code === 401).assertTrue();
      }
    })

    /**
     * @tc.name   collator_test_static_3510
     * @tc.number SUB_GLOBAL_INTL_JS_COLLATOR_static_3510
     * @tc.desc   compare the same strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('collator_test_static_3510', Level.LEVEL2, async (): Promise<void> => {
      let coll = new Intl.Collator();
      let value = coll.compare('a', 'a');
      console.log('collator_test_static_3100 ' + value);
      expect(value).assertEqual(0);
    })

    /**
     * @tc.name   i18n_normalizer_test_static_1000
     * @tc.number SUB_GLOBAL_I18N_NORMALIZE_JS_static_1000
     * @tc.desc   normalize method return 401 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('i18n_normalizer_test_static_1000', Level.LEVEL3, async (): Promise<void> => {
      console.log('i18n_normalizer_test_static_1000 ' + 'start');
      let str = '\u0032\u2075';
      let normal = i18n.Normalizer.getInstance(i18n.NormalizerMode.NFC);
      try {
        let value = normal.normalize('1234');
      } catch (error: BusinessError) {
        console.log('i18n_normalizer_test_static_1000 ' + error.code);
        console.log('i18n_normalizer_test_static_1000 ' + error.message);
        expect(error.code === 401).assertTrue();
      }
    })

    /**
     * @tc.name   bleStopBLEScanTest
     * @tc.number bleStopBLEScanTest
     * @tc.desc   Test bleStopBLEScanTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("bleStopBLEScanTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        ble.stopBLEScan();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "stopBLEScan get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code === 801);
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_static_0100
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_0100
     * @tc.desc   test isValidNumber interface with 13510574676 param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_phonenumberformat_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_0100 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN');
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_0100 ' + ran);
      let valid = phonenumber.isValidNumber('1351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_0100 ' + valid);
      expect(valid).assertEqual(true);
    })


    /**
     * @tc.name   collator_test_static_3500
     * @tc.number SUB_GLOBAL_INTL_JS_COLLATOR_static_3500
     * @tc.desc   compare two different strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collator_test_static_3500', Level.LEVEL0, async (): Promise<void> => {
      let coll = new Intl.Collator();
      let value = coll.compare('a', 'b');
      console.log('collator_test_static_3500 ' + value);
      expect(value).assertEqual(-1);
    })

    /**
     * @tc.name   i18n_phonenumberformat_test_static_0200
     * @tc.number SUB_GLOBAL_I18N_PHONENUMBERFORMAT_JS_static_0200
     * @tc.desc   test isValidNumber interface with 13510574676 and undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_phonenumberformat_test_static_0200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_phonenumberformat_test_static_0200 ' + 'start');
      let phonenumber = new i18n.PhoneNumberFormat('CN', undefined);
      let ran = Math.ceil(Math.random() * 9);
      console.log('i18n_phonenumberformat_test_static_0200 ' + ran);
      let valid = phonenumber.isValidNumber('1351057467' + ran);
      console.log('i18n_phonenumberformat_test_static_0200 ' + valid);
      expect(valid).assertEqual(true);
    })

  })
}