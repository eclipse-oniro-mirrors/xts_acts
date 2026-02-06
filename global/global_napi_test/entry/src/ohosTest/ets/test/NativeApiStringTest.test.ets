/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import nativeTest from 'libentry.so'
import { GlobalContext } from '../test/global';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let resManager: Context;
    beforeEach(() => {
      resManager = (GlobalContext.getContext().getObject('yq') as Context);
    })
    /* *
    * @tc.number    : SUB_GLOBAL_getFileList_0100
    * @tc.name      : getResourceManager_nativeTest_0100
    * @tc.desc      : getResourceManager with folder
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getResourceManager_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getResourceManager_nativeTest_0100 1");
      let value = nativeTest.getFileList(resManager.resourceManager, "test");
      console.log("getResourceManager_nativeTest_0100 3");
      console.log("getResourceManager_nativeTest_0100" + value);
      console.log("getResourceManager_nativeTest_0100" + value.length);
      expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getRawFileContent_0200
    * @tc.name      : getResourceManager_nativeTest_0200
    * @tc.desc      : getRawFileContent with file path
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getResourceManager_nativeTest_0200', Level.LEVEL0, () => {
      console.log("getResourceManager_nativeTest_0200 1");
      let value = nativeTest.getRawFileContent(resManager.resourceManager, "test/aa.xml");
      console.log("getResourceManager_nativeTest_0200 3");
      console.log("getResourceManager_nativeTest_0200" + value);
      expect(value !== null).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getRawFileDescriptor_0300
    * @tc.name      : getResourceManager_nativeTest_0300
    * @tc.desc      : getRawFileDescriptor with file path
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getResourceManager_nativeTest_0300', Level.LEVEL0, () => {
      console.log("getResourceManager_nativeTest_0300 1");
      let value = nativeTest.getRawFileDescriptor(resManager.resourceManager, "test/aa.xml");
      console.log("getResourceManager_nativeTest_0300 3");
      console.log("getResourceManager_nativeTest_0300" + value.fd);
      console.log("getResourceManager_nativeTest_0300" + value.offset);
      console.log("getResourceManager_nativeTest_0300" + value.length);
      expect(value !== null).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getRawFileDescriptor64_0400
    * @tc.name      : getResourceManager_nativeTest_0400
    * @tc.desc      : getRawFileDescriptor64 with file path
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getResourceManager_nativeTest_0400', Level.LEVEL0, () => {
      console.log("getResourceManager_nativeTest_0400 1");
      let value = nativeTest.getRawFileDescriptor64(resManager.resourceManager, "test/aa.xml");
      console.log("getResourceManager_nativeTest_0400 3");
      console.log("getResourceManager_nativeTest_0400" + value);
      expect(value !== null).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getRawFileDescriptor64_0500
    * @tc.name      : getResourceManager_nativeTest_0500
    * @tc.desc      : getRawFileDescriptor64 with file path
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getResourceManager_nativeTest_0500', Level.LEVEL2, () => {
      console.log("getResourceManager_nativeTest_0500 1");
      let value = nativeTest.getRawFileDescriptor64(resManager.resourceManager, "test/aa.xml");
      console.log("getResourceManager_nativeTest_0500 3");
      console.log("getResourceManager_nativeTest_0500" + value.fd);
      console.log("getResourceManager_nativeTest_0500" + value.offset);
      console.log("getResourceManager_nativeTest_0500" + value.length);
      expect(value !== null).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_isRawDir_0100
    * @tc.name      : isRawDir_nativeTest_0100
    * @tc.desc      : isRawDir with null
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('isRawDir_nativeTest_0100', Level.LEVEL0, () => {
      console.log("isRawDir_nativeTest_0100 1");
      let value = nativeTest.isRawDir(resManager.resourceManager, '');
      console.log("isRawDir_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_SUB_GLOBAL_getDrawableDescriptor_0100
    * @tc.name      : getDrawableDescriptor_nativeTest_0100
    * @tc.desc      : getDrawableDescriptor with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getDrawableDescriptor_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getDrawableDescriptor_nativeTest_0100 1");
      let value = nativeTest.getDrawableDescriptor(resManager.resourceManager, $r('app.media.icon').id);
      console.log("getDrawableDescriptor_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getDrawableDescriptorByName_0100
    * @tc.name      : getDrawableDescriptorByName_nativeTest_0100
    * @tc.desc      : getDrawableDescriptorByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getDrawableDescriptorByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getDrawableDescriptorByName_nativeTest_0100 1");
      let value = nativeTest.getDrawableDescriptorByName(resManager.resourceManager);
      console.log("getDrawableDescriptorByName_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaBase64_0100
    * @tc.name      : getMediaBase64_nativeTest_0100
    * @tc.desc      : getMediaBase64 with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getMediaBase64_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getMediaBase64_nativeTest_0100 1");
      let value = nativeTest.getMediaBase64(resManager.resourceManager, $r('app.media.icon').id);
      console.log("getMediaBase64_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaBase64ByName_0100
    * @tc.name      : getMediaBase64ByName_nativeTest_0100
    * @tc.desc      : getMediaBase64ByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getMediaBase64ByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getMediaBase64ByName_nativeTest_0100 1");
      let value = nativeTest.getMediaBase64ByName(resManager.resourceManager);
      console.log("getMediaBase64ByName_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMedia_0100
    * @tc.name      : getMedia_nativeTest_0100
    * @tc.desc      : getMedia with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getMedia_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getMedia_nativeTest_0100 1");
      let value = nativeTest.getMedia(resManager.resourceManager, $r('app.media.icon').id);
      console.log("getMedia_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaByName_0100
    * @tc.name      : getMediaByName_nativeTest_0100
    * @tc.desc      : getMediaByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getMediaByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getMediaByName_nativeTest_0100 1");
      let value = nativeTest.getMediaByName(resManager.resourceManager);
      console.log("getMediaByName_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getSymbolByName_0100
    * @tc.name      : getSymbolByName_nativeTest_0100
    * @tc.desc      : getSymbolByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getSymbolByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getSymbolByName_nativeTest_0100 1");
      let value = nativeTest.getSymbolByName(resManager.resourceManager);
      console.log("getSymbolByName_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getSymbol_0100
    * @tc.name      : getSymbol_nativeTest_0100
    * @tc.desc      : getSymbol with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getSymbol_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getSymbol_nativeTest_0100 1");
      let value = nativeTest.getSymbol(resManager.resourceManager, $r('app.symbol.symbol_test').id);
      console.log("getSymbol_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getBoolByName_0100
    * @tc.name      : getBoolByName_nativeTest_0100
    * @tc.desc      : getBoolByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getBoolByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getBoolByName_nativeTest_0100 1");
      let value = nativeTest.getBoolByName(resManager.resourceManager);
      console.log("getBoolByName_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getBool_0100
    * @tc.name      : getBool_nativeTest_0100
    * @tc.desc      : getBool with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getBool_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getBool_nativeTest_0100 1");
      let value = nativeTest.getBool(resManager.resourceManager, $r('app.boolean.boolean_one').id);
      console.log("getBool_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getPluralStringByName_0100
    * @tc.name      : getPluralStringByName_nativeTest_0100
    * @tc.desc      : getPluralStringByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('getPluralStringByName_nativeTest_0100', Level.LEVEL3, () => {
      console.log("getPluralStringByName_nativeTest_0100 1");
      let value = nativeTest.getPluralStringByName(resManager.resourceManager);
      console.log("getPluralStringByName_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getPluralString_0100
    * @tc.name      : getPluralString_nativeTest_0100
    * @tc.desc      : getPluralString with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('getPluralString_nativeTest_0100', Level.LEVEL3, () => {
      console.log("getPluralString_nativeTest_0100 1");
      let value = nativeTest.getPluralString(resManager.resourceManager, $r('app.plural.eat_apple').id, 1);
      console.log("getPluralString_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getColorByName_0100
    * @tc.name      : getColorByName_nativeTest_0100
    * @tc.desc      : getColorByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getColorByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getColorByName_nativeTest_0100 1");
      let value = nativeTest.getColorByName(resManager.resourceManager);
      console.log("getColorByName_nativeTest_0100" + value);
      expect(value).assertEqual(4294967210);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getColor_0100
    * @tc.name      : getColor_nativeTest_0100
    * @tc.desc      : getColor with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getColor_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getColor_nativeTest_0100 1");
      let value = nativeTest.getColor(resManager.resourceManager, $r('app.color.start_window_background_test').id);
      console.log("getColor_nativeTest_0100" + value);
      expect(value).assertEqual(4294967210);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getIntByName_0100
    * @tc.name      : getIntByName_nativeTest_0100
    * @tc.desc      : getIntByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getIntByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getIntByName_nativeTest_0100 1");
      let value = nativeTest.getIntByName(resManager.resourceManager);
      console.log("getIntByName_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getInt_0100
    * @tc.name      : getInt_nativeTest_0100
    * @tc.desc      : getInt with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getInt_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getInt_nativeTest_0100 1");
      let value = nativeTest.getInt(resManager.resourceManager, $r('app.integer.integer_one').id);
      console.log("getInt_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getFloatByName_0100
    * @tc.name      : getFloatByName_nativeTest_0100
    * @tc.desc      : getFloatByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getFloatByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getFloatByName_nativeTest_0100 1");
      let value = nativeTest.getFloatByName(resManager.resourceManager);
      console.log("getFloatByName_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getFloat_0100
    * @tc.name      : getFloat_nativeTest_0100
    * @tc.desc      : getFloat with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getFloat_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getFloat_nativeTest_0100 1");
      let value = nativeTest.getFloat(resManager.resourceManager, $r('app.float.float_one').id);
      console.log("getFloat_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getLocales_0100
    * @tc.name      : getLocales_nativeTest_0100
    * @tc.desc      : getLocales with object
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getLocales_nativeTest_0100', Level.LEVEL2, () => {
      console.log("getLocales_nativeTest_0100 1");
      let value = nativeTest.getLocales(resManager.resourceManager);
      console.log("getLocales_nativeTest_0100" + value);
      expect('' + value).assertEqual('en-US,zh-CN');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getConfiguration_0100
    * @tc.name      : getConfiguration_nativeTest_0100
    * @tc.desc      : getConfiguration with object
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getConfiguration_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getConfiguration_nativeTest_0100 1");
      let value = nativeTest.getConfiguration(resManager.resourceManager);
      console.log("getConfiguration_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getStringArray_0100
    * @tc.name      : getStringArray_nativeTest_0100
    * @tc.desc      : getStringArray with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getStringArray_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getStringArray_nativeTest_0100 1");
      let value = nativeTest.getStringArray(resManager.resourceManager, $r('app.strarray.size').id);
      console.log("getStringArray_nativeTest_0100" + value);
      expect('' + value).assertEqual('small,big');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getStringArrayByName_0100
    * @tc.name      : getStringArrayByName_nativeTest_0100
    * @tc.desc      : getStringArrayByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getStringArrayByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getStringArrayByName_nativeTest_0100 1");
      let value = nativeTest.getStringArrayByName(resManager.resourceManager);
      console.log("getStringArrayByName_nativeTest_0100" + value);
      expect('' + value).assertEqual('small,big');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_releaseStringArray_0100
    * @tc.name      : releaseStringArray_nativeTest_0100
    * @tc.desc      : releaseStringArray with object
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('releaseStringArray_nativeTest_0100', Level.LEVEL0, () => {
      console.log("releaseStringArray_nativeTest_0100 1");
      let value = nativeTest.releaseStringArray(resManager.resourceManager);
      console.log("releaseStringArray_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_releaseConfiguration_0100
    * @tc.name      : releaseConfiguration_nativeTest_0100
    * @tc.desc      : releaseConfiguration with object
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('releaseConfiguration_nativeTest_0100', Level.LEVEL0, () => {
      console.log("releaseConfiguration_nativeTest_0100 1");
      let value = nativeTest.releaseConfiguration(resManager.resourceManager);
      console.log("releaseConfiguration_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getStringByName_0100
    * @tc.name      : getStringByName_nativeTest_0100
    * @tc.desc      : getStringByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getStringByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getStringByName_nativeTest_0100 1");
      let value = nativeTest.getStringByName(resManager.resourceManager);
      console.log("getStringByName_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getString_0100
    * @tc.name      : getString_nativeTest_0100
    * @tc.desc      : getString with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getString_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getString_nativeTest_0100 1");
      let value = nativeTest.getString(resManager.resourceManager, $r('app.string.entry_MainAbility').id);
      console.log("getString_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getRawFileDescriptorData_0100
    * @tc.name      : getRawFileDescriptorData_nativeTest_0100
    * @tc.desc      : getRawFileDescriptorData with normal xml
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getRawFileDescriptorData_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getRawFileDescriptorData_nativeTest_0100 1");
      let value = nativeTest.getRawFileDescriptorData(resManager.resourceManager, "test/aa.xml");
      console.log("getRawFileDescriptorData_nativeTest_0100" + value);
      expect(value.length).assertLarger(0);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getLocalesData_0100
    * @tc.name      : getLocalesData_nativeTest_0100
    * @tc.desc      : getLocalesData with object
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getLocalesData_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getLocalesData_nativeTest_0100 1");
      let value = nativeTest.getLocalesData(resManager.resourceManager);
      console.log("getLocalesData_nativeTest_0100" + value);
      expect(value != null).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaBase64DataByName_0100
    * @tc.name      : getMediaBase64DataByName_nativeTest_0100
    * @tc.desc      : getMediaBase64DataByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getMediaBase64DataByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getMediaBase64DataByName_nativeTest_0100 1");
      let value = nativeTest.getMediaBase64DataByName(resManager.resourceManager, "icon");
      console.log("getMediaBase64DataByName_nativeTest_0100" + value);
      expect(value != null).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaBase64Data_0100
    * @tc.name      : getMediaBase64Data_nativeTest_0100
    * @tc.desc      : getMediaBase64Data with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getMediaBase64Data_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getMediaBase64Data_nativeTest_0100 1");
      let value = nativeTest.getMediaBase64Data(resManager.resourceManager, $r('app.media.icon').id);
      console.log("getMediaBase64Data_nativeTest_0100" + value);
      expect(value != null).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaData_0100
    * @tc.name      : getMediaData_nativeTest_0100
    * @tc.desc      : getMediaData with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getMediaData_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getMediaData_nativeTest_0100 1");
      let value = nativeTest.getMediaData(resManager.resourceManager, $r('app.media.icon').id);
      console.log("getMediaData_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaDataByName_0100
    * @tc.name      : getMediaDataByName_nativeTest_0100
    * @tc.desc      : getMediaDataByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getMediaDataByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getMediaDataByName_nativeTest_0100 1");
      let value = nativeTest.getMediaDataByName(resManager.resourceManager, "icon");
      console.log("getMediaDataByName_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getDrawableDescriptorData_0100
    * @tc.name      : getDrawableDescriptorData_nativeTest_0100
    * @tc.desc      : getDrawableDescriptorData with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getDrawableDescriptorData_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getDrawableDescriptorData_nativeTest_0100 1");
      let value = nativeTest.getDrawableDescriptorData(resManager.resourceManager, $r('app.media.icon').id);
      console.log("getDrawableDescriptorData_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getDrawableDescriptorDataByName_0100
    * @tc.name      : getDrawableDescriptorDataByName_nativeTest_0100
    * @tc.desc      : getDrawableDescriptorDataByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getDrawableDescriptorDataByName_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getDrawableDescriptorDataByName_nativeTest_0100 1");
      let value = nativeTest.getDrawableDescriptorDataByName(resManager.resourceManager, "icon");
      console.log("getDrawableDescriptorDataByName_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_addResource_0100
    * @tc.name      : addResource_nativeTest_0100
    * @tc.desc      : addResource with null
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('addResource_nativeTest_0100', Level.LEVEL3, () => {
      console.log("addResource_nativeTest_0100 1");
      let value = nativeTest.addResource(resManager.resourceManager);
      console.log("addResource_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_removeResource_0100
    * @tc.name      : removeResource_nativeTest_0100
    * @tc.desc      : removeResource with null
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('removeResource_nativeTest_0100', Level.LEVEL3, () => {
      console.log("removeResource_nativeTest_0100 1");
      let value = nativeTest.removeResource(resManager.resourceManager);
      console.log("removeResource_nativeTest_0100" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getRawFile_0020
    * @tc.name      : getRawFileContent_nativeTest_0020
    * @tc.desc      : getRawFileContent support seek
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getRawFileContent_nativeTest_0020', Level.LEVEL0, () => {
      console.log("getRawFileContent_nativeTest_0020 1");
      let value = nativeTest.getRawFileContentTwo(resManager.resourceManager, 'rawfileTest.txt');
      console.log("getRawFileContent_nativeTest_0020 3");
      let dataString = "";
      for (let i = 0; i < value.length; i++) {
        dataString += String.fromCharCode(value[i]);
      }
      console.log("getRawFileContent_nativeTest_0020 value:" + value);
      console.log("getRawFileContent_nativeTest_0020 dataString:" + dataString);
      expect(dataString == 'qwem7890weasd123').assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_0790
    * @tc.name      : testGetIntPluralStringById0790_082
    * @tc.desc      : OH_ResourceManager_GetIntPluralString with resID
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testGetIntPluralStringById0790_082', Level.LEVEL0, () => {
      console.log("testGetIntPluralStringById0790_082 start");
      let value = nativeTest.testGetIntPluralStringById0790_082(resManager.resourceManager, $r('app.plural.p_str7').id);
      console.log("testGetIntPluralStringById0790_082" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_0790
    * @tc.name      : testGetIntPluralStringByName0790_082
    * @tc.desc      : OH_ResourceManager_GetIntPluralStringByName with resName
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testGetIntPluralStringByName0790_082', Level.LEVEL0, () => {
      console.log("testGetIntPluralStringByName0790_082 start");
      let value = nativeTest.testGetIntPluralStringByName0790_082(resManager.resourceManager, 'p_str7');
      console.log("testGetIntPluralStringByName0790_082" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_0790
    * @tc.name      : testGetDoublePluralStringById0790_082
    * @tc.desc      : OH_ResourceManager_GetDoublePluralString with resID
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testGetDoublePluralStringById0790_082', Level.LEVEL0, () => {
      console.log("testGetDoublePluralStringById0790_082 start");
      let value =
        nativeTest.testGetDoublePluralStringById0790_082(resManager.resourceManager, $r('app.plural.p_str7').id);
      console.log("testGetDoublePluralStringById0790_082" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_0790
    * @tc.name      : testGetDoublePluralStringByName0790_082
    * @tc.desc      : OH_ResourceManager_GetDoublePluralStringByName with resName
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testGetDoublePluralStringByName0790_082', Level.LEVEL0, () => {
      console.log("testGetDoublePluralStringByName0790_082 start");
      let value =
        nativeTest.testGetDoublePluralStringByName0790_082(resManager.resourceManager, 'p_str7');
      console.log("testGetDoublePluralStringByName0790_082" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1190
    * @tc.name      : testGetIntPluralStringById119
    * @tc.desc      : error code 401
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetIntPluralStringById119', Level.LEVEL3, () => {
      console.log("testGetIntPluralStringById119 start");
      let value = nativeTest.testGetIntPluralStringById119(resManager.resourceManager, $r('app.plural.p_str4').id);
      console.log("testGetIntPluralStringById119" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1210
    * @tc.name      : testGetDoublePluralStringById120
    * @tc.desc      : error code 401
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetDoublePluralStringById120', Level.LEVEL3, () => {
      console.log("testGetDoublePluralStringById120 start");
      let value = nativeTest.testGetDoublePluralStringById120(resManager.resourceManager, $r('app.plural.p_str4').id);
      console.log("testGetDoublePluralStringById120" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1310
    * @tc.name      : testGetIntPluralStringById125
    * @tc.desc      : error code 9001001
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetIntPluralStringById125', Level.LEVEL3, () => {
      console.log("testGetIntPluralStringById125 start");
      let value = nativeTest.testGetIntPluralStringById125(resManager.resourceManager, $r('app.plural.p_str4').id);
      console.log("testGetIntPluralStringById125" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1330
    * @tc.name      : testGetDoublePluralStringById126
    * @tc.desc      : error code 9001001
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetDoublePluralStringById126', Level.LEVEL3, () => {
      console.log("testGetDoublePluralStringById126 start");
      let value = nativeTest.testGetDoublePluralStringById126(resManager.resourceManager, $r('app.plural.p_str4').id);
      console.log("testGetDoublePluralStringById126" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1350
    * @tc.name      : testGetIntPluralStringById127
    * @tc.desc      : error code 9001002
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetIntPluralStringById127', Level.LEVEL3, () => {
      console.log("testGetIntPluralStringById127 start");
      let value = nativeTest.testGetIntPluralStringById127(resManager.resourceManager, $r('app.plural.p_str4').id,
        $r('app.media.icon').id);
      console.log("testGetIntPluralStringById127" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1370
    * @tc.name      : testGetDoublePluralStringById128
    * @tc.desc      : error code 9001002
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetDoublePluralStringById128', Level.LEVEL3, () => {
      console.log("testGetDoublePluralStringById128 start");
      let value = nativeTest.testGetDoublePluralStringById128(resManager.resourceManager, $r('app.plural.p_str4').id,
        $r('app.media.icon').id);
      console.log("testGetDoublePluralStringById128" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1390
    * @tc.name      : testGetIntPluralStringById129
    * @tc.desc      : error code 9001006
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetIntPluralStringById129', Level.LEVEL3, () => {
      console.log("testGetIntPluralStringById129 start");
      let value = nativeTest.testGetIntPluralStringById129(resManager.resourceManager, $r('app.plural.p_str4').id,
        $r('app.plural.test_cyc').id);
      console.log("testGetIntPluralStringById129" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1410
    * @tc.name      : testGetDoublePluralStringById130
    * @tc.desc      : error code 9001006
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetDoublePluralStringById130', Level.LEVEL3, () => {
      console.log("testGetDoublePluralStringById130 start");
      let value = nativeTest.testGetDoublePluralStringById130(resManager.resourceManager, $r('app.plural.p_str4').id,
        $r('app.plural.test_cyc').id);
      console.log("testGetDoublePluralStringById130" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1470
    * @tc.name      : testGetIntPluralStringByName133
    * @tc.desc      : error code 401
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetIntPluralStringByName133', Level.LEVEL3, () => {
      console.log("testGetIntPluralStringByName133 start");
      let value = nativeTest.testGetIntPluralStringByName133(resManager.resourceManager, 'p_str4');
      console.log("testGetIntPluralStringByName133" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1480
    * @tc.name      : testGetDoublePluralStringByName134
    * @tc.desc      : error code 401
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetDoublePluralStringByName134', Level.LEVEL3, () => {
      console.log("testGetDoublePluralStringByName134 start");
      let value = nativeTest.testGetDoublePluralStringByName134(resManager.resourceManager, 'p_str4');
      console.log("testGetDoublePluralStringByName134" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1530
    * @tc.name      : testGetIntPluralStringByName139
    * @tc.desc      : error code 9001003
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetIntPluralStringByName139', Level.LEVEL3, () => {
      console.log("testGetIntPluralStringByName139 start");
      let value = nativeTest.testGetIntPluralStringByName139(resManager.resourceManager, 'p_str4');
      console.log("testGetIntPluralStringByName139" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1540
    * @tc.name      : testGetDoublePluralStringByName140
    * @tc.desc      : error code 9001003
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetDoublePluralStringByName140', Level.LEVEL3, () => {
      console.log("testGetDoublePluralStringByName140 start");
      let value = nativeTest.testGetDoublePluralStringByName140(resManager.resourceManager, 'p_str4');
      console.log("testGetDoublePluralStringByName140" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1550
    * @tc.name      : testGetIntPluralStringByName141
    * @tc.desc      : error code 9001006
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetIntPluralStringByName141', Level.LEVEL3, () => {
      console.log("testGetIntPluralStringByName141 start");
      let value = nativeTest.testGetIntPluralStringByName141(resManager.resourceManager, 'p_str4');
      console.log("testGetIntPluralStringByName141" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_ResourceManager_Plural_1560
    * @tc.name      : testGetDoublePluralStringByName142
    * @tc.desc      : error code 9001006
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testGetDoublePluralStringByName142', Level.LEVEL3, () => {
      console.log("testGetDoublePluralStringByName142 start");
      let value = nativeTest.testGetDoublePluralStringByName142(resManager.resourceManager, 'p_str4');
      console.log("testGetDoublePluralStringByName142" + value);
      expect(value).assertTrue();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getResourceConfiguration_0100
    * @tc.name      : getResourceConfiguration_nativeTest_0100
    * @tc.desc      : getResourceConfiguration with object
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('getResourceConfiguration_nativeTest_0100', Level.LEVEL0, () => {
      console.log("getResourceConfiguration_nativeTest_0100 1");
      let value = nativeTest.getResourceConfiguration(resManager.resourceManager);
      console.log("getResourceConfiguration_nativeTest_0100" + value);
      expect(value).assertTrue();
    })
  })
}