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

import { describe, beforeEach, it, expect, Level, TestType, Size } from '@ohos/hypium'
import nativeTest from 'libentry.so'
import { GlobalContext } from '../test/global';

const SUCCESS = 0 // 成功
const ERROR_CODE_INVALID_INPUT_PARAMETER = 401 // 参数无效
const ERROR_CODE_RES_ID_NOT_FOUND = 9001001 // 无效的资源ID
const ERROR_CODE_RES_NOT_FOUND_BY_ID  = 9001002 // 没有根据资源ID找到匹配的资源
const ERROR_CODE_RES_NAME_NOT_FOUND = 9001003 // 无效的资源名称
const ERROR_CODE_RES_NOT_FOUND_BY_NAME = 9001004 // 没有根据资源名称找到匹配的资源
const ERROR_CODE_RES_REF_TOO_MUCH = 9001006 // 资源被循环引用

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let resManager: Context;
    beforeEach(() => {
      resManager = (GlobalContext.getContext().getObject('yq') as Context);
      nativeTest.GetResourceManager(resManager.resourceManager);
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetMediaBase64_0100
    * @tc.name      TestGetMediaBase640100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase640100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase640100 start====");
          let result: number = nativeTest.GetMediaBase640100($r('app.media.icon').id);
          console.info(`====>TestGetMediaBase640100 result====${result}`);
          expect(result).assertEqual(SUCCESS);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase640100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetMediaBase64_0200
    * @tc.name      TestGetMediaBase640200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase640200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase640200 start====");
          let result: number = nativeTest.GetMediaBase640200($r('app.media.icon').id);
          console.info(`====>TestGetMediaBase640200 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase640200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetMediaBase64_0300
    * @tc.name      TestGetMediaBase640300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase640300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase640300 start====");
          let result: number = nativeTest.GetMediaBase640300(0);
          console.info(`====>TestGetMediaBase640300 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase640300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetMediaBase64_0400
    * @tc.name      TestGetMediaBase640400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase640400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase640400 start====");
          let result: number = nativeTest.GetMediaBase640400($r('app.string.app_name').id);
          console.info(`====>TestGetMediaBase640400 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase640400 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64DATA_0100
    * @tc.name      TestGetMediaBase64Data0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase64Data0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64Data0100 start====");
          let result: number = nativeTest.GetMediaBase64Data0100($r('app.media.icon').id);
          console.info(`====>TestGetMediaBase64Data0100 result====${result}`);
          expect(result).assertEqual(SUCCESS);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64Data0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64DATA_0200
    * @tc.name      TestGetMediaBase64Data0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase64Data0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64Data0200 start====");
          let result: number = nativeTest.GetMediaBase64Data0200($r('app.media.icon').id);
          console.info(`====>TestGetMediaBase64Data0200 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64Data0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64DATA_0300
    * @tc.name      TestGetMediaBase64Data0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase64Data0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64Data0300 start====");
          let result: number = nativeTest.GetMediaBase64Data0300(0);
          console.info(`====>TestGetMediaBase64Data0300 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64Data0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64DATA_0400
    * @tc.name      TestGetMediaBase64Data0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase64Data0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64Data0400 start====");
          let result: number = nativeTest.GetMediaBase64Data0400($r('app.string.app_name').id);
          console.info(`====>TestGetMediaBase64Data0400 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64Data0400 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64BYNAME_0100
    * @tc.name      TestGetMediaBase64ByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase64ByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64ByName0100 start====");
          let result: number = nativeTest.GetMediaBase64ByName0100('icon');
          console.info(`====>TestGetMediaBase64ByName0100 result====${result}`);
          expect(result).assertEqual(SUCCESS);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64ByName0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64BYNAME_0200
    * @tc.name      TestGetMediaBase64ByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase64ByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64ByName0200 start====");
          let result: number = nativeTest.GetMediaBase64ByName0200('icon');
          console.info(`====>TestGetMediaBase64ByName0200 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64ByName0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64BYNAME_0300
    * @tc.name      TestGetMediaBase64ByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase64ByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64ByName0300 start====");
          let result: number = nativeTest.GetMediaBase64ByName0300('');
          console.info(`====>TestGetMediaBase64ByName0300 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64ByName0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64DATABYNAME_0100
    * @tc.name      TestGetMediaBase64DataByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase64DataByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64DataByName0100 start====");
          let result: number = nativeTest.GetMediaBase64DataByName0100('icon');
          console.info(`====>TestGetMediaBase64DataByName0100 result====${result}`);
          expect(result).assertEqual(SUCCESS);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64DataByName0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64DATABYNAME_0200
    * @tc.name      TestGetMediaBase64DataByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase64DataByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64DataByName0200 start====");
          let result: number = nativeTest.GetMediaBase64DataByName0200('icon');
          console.info(`====>TestGetMediaBase64DataByName0200 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64DataByName0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABASE64DATABYNAME_0300
    * @tc.name      TestGetMediaBase64DataByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaBase64DataByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMediaBase64DataByName0300 start====");
          let result: number = nativeTest.GetMediaBase64DataByName0300('');
          console.info(`====>TestGetMediaBase64DataByName0300 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
          done()
        } catch (err) {
          console.error("====>TestGetMediaBase64DataByName0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIA_0100
    * @tc.name      TestGetMedia0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMedia0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMedia0100 start====");
          let result: number = nativeTest.GetMedia0100($r('app.media.icon').id);
          console.info(`====>TestGetMedia0100 result====${result}`);
          expect(result).assertEqual(SUCCESS);
          done()
        } catch (err) {
          console.error("====>TestGetMedia0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIA_0200
    * @tc.name      TestGetMedia0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMedia0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMedia0200 start====");
          let result: number = nativeTest.GetMedia0200($r('app.media.icon').id);
          console.info(`====>TestGetMedia0200 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
          done()
        } catch (err) {
          console.error("====>TestGetMedia0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIA_0300
    * @tc.name      TestGetMedia0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMedia0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMedia0300 start====");
          let result: number = nativeTest.GetMedia0300(0);
          console.info(`====>TestGetMedia0300 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
          done()
        } catch (err) {
          console.error("====>TestGetMedia0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIA_0400
    * @tc.name      TestGetMedia0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMedia0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>TestGetMedia0400 start====");
          let result: number = nativeTest.GetMedia0400($r('app.string.app_name').id);
          console.info(`====>TestGetMedia0400 result====${result}`);
          expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
          done()
        } catch (err) {
          console.error("====>TestGetMedia0400 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIADATA_0100
    * @tc.name      TestGetMediaData0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetMediaData0100 start====");
        let result: number = nativeTest.GetMediaData0100($r('app.media.icon').id);
        console.info(`====>TestGetMediaData0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetMediaData0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIADATA_0200
    * @tc.name      TestGetMediaData0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaData0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetMediaData0200 start====");
        let result: number = nativeTest.GetMediaData0200($r('app.media.icon').id);
        console.info(`====>TestGetMediaData0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetMediaData0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIADATA_0300
    * @tc.name      TestGetMediaData0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaData0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetMediaData0300 start====");
        let result: number = nativeTest.GetMediaData0300(0);
        console.info(`====>TestGetMediaData0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetMediaData0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIADATA_0400
    * @tc.name      TestGetMediaData0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaData0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetMediaData0400 start====");
        let result: number = nativeTest.GetMediaData0400($r('app.string.app_name').id);
        console.info(`====>TestGetMediaData0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetMediaData0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABYNAME_0100
    * @tc.name      TestGetMediaByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetMediaByName0100 start====");
        let result: number = nativeTest.GetMediaByName0100('icon');
        console.info(`====>TestGetMediaByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetMediaByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABYNAME_0200
    * @tc.name      TestGetMediaByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetMediaByName0200 start====");
        let result: number = nativeTest.GetMediaByName0200('icon');
        console.info(`====>TestGetMediaByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetMediaByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIABYNAME_0300
    * @tc.name      TestGetMediaByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetMediaByName0300 start====");
        let result: number = nativeTest.GetMediaByName0300('');
        console.info(`====>TestGetMediaByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetMediaByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIADATABYNAME_0100
    * @tc.name      TestGetMediaDataByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaDataByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetMediaDataByName0100 start====");
        let result: number = nativeTest.GetMediaDataByName0100('icon');
        console.info(`====>TestGetMediaDataByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetMediaDataByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIADATABYNAME_0200
    * @tc.name      TestGetMediaDataByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaDataByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetMediaDataByName0200 start====");
        let result: number = nativeTest.GetMediaDataByName0200('icon');
        console.info(`====>TestGetMediaDataByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetMediaDataByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETMEDIADATABYNAME_0300
    * @tc.name      TestGetMediaDataByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetMediaDataByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetMediaDataByName0300 start====");
        let result: number = nativeTest.GetMediaDataByName0300('');
        console.info(`====>TestGetMediaDataByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetMediaDataByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTOR_0100
    * @tc.name      TestGetDrawableDescriptor0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptor0100 start====");
        let result: number = nativeTest.GetDrawableDescriptor0100($r('app.media.icon').id);
        console.info(`====>TestGetDrawableDescriptor0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptor0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTOR_0200
    * @tc.name      TestGetDrawableDescriptor0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptor0200 start====");
        let result: number = nativeTest.GetDrawableDescriptor0200($r('app.media.icon').id);
        console.info(`====>TestGetDrawableDescriptor0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptor0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTOR_0300
    * @tc.name      TestGetDrawableDescriptor0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptor0300 start====");
        let result: number = nativeTest.GetDrawableDescriptor0300(0);
        console.info(`====>TestGetDrawableDescriptor0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptor0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTOR_0400
    * @tc.name      TestGetDrawableDescriptor0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptor0400 start====");
        let result: number = nativeTest.GetDrawableDescriptor0400($r('app.string.app_name').id);
        console.info(`====>TestGetDrawableDescriptor0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptor0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTORDATA_0100
    * @tc.name      TestGetDrawableDescriptorData0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptorData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptorData0100 start====");
        let result: number = nativeTest.GetDrawableDescriptorData0100($r('app.media.icon').id);
        console.info(`====>TestGetDrawableDescriptorData0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptorData0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTORDATA_0200
    * @tc.name      TestGetDrawableDescriptorData0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptorData0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptorData0200 start====");
        let result: number = nativeTest.GetDrawableDescriptorData0200($r('app.media.icon').id);
        console.info(`====>TestGetDrawableDescriptorData0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptorData0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTORDATA_0300
    * @tc.name      TestGetDrawableDescriptorData0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptorData0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptorData0300 start====");
        let result: number = nativeTest.GetDrawableDescriptorData0300(0);
        console.info(`====>TestGetDrawableDescriptorData0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptorData0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTORDATA_0400
    * @tc.name      TestGetDrawableDescriptorData0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptorData0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptorData0400 start====");
        let result: number = nativeTest.GetDrawableDescriptorData0400($r('app.string.app_name').id);
        console.info(`====>TestGetDrawableDescriptorData0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptorData0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTORBYNAME_0100
    * @tc.name      TestGetDrawableDescriptorByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptorByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptorByName0100 start====");
        let result: number = nativeTest.GetDrawableDescriptorByName0100();
        console.info(`====>TestGetDrawableDescriptorByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptorByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTORBYNAME_0200
    * @tc.name      TestGetDrawableDescriptorByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptorByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptorByName0200 start====");
        let result: number = nativeTest.GetDrawableDescriptorByName0200();
        console.info(`====>TestGetDrawableDescriptorByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptorByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTORBYNAME_0300
    * @tc.name      TestGetDrawableDescriptorByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptorByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptorByName0300 start====");
        let result: number = nativeTest.GetDrawableDescriptorByName0300();
        console.info(`====>TestGetDrawableDescriptorByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptorByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTORDATABYNAME_0100
    * @tc.name      TestGetDrawableDescriptorDataByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptorDataByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptorDataByName0100 start====");
        let result: number = nativeTest.GetDrawableDescriptorDataByName0100('icon');
        console.info(`====>TestGetDrawableDescriptorDataByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptorDataByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTORDATABYNAME_0200
    * @tc.name      TestGetDrawableDescriptorDataByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptorDataByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptorDataByName0200 start====");
        let result: number = nativeTest.GetDrawableDescriptorDataByName0200('icon');
        console.info(`====>TestGetDrawableDescriptorDataByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptorDataByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETDRAWABLEDESCRIPTORDATABYNAME_0300
    * @tc.name      TestGetDrawableDescriptorDataByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetDrawableDescriptorDataByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetDrawableDescriptorDataByName0300 start====");
        let result: number = nativeTest.GetDrawableDescriptorDataByName0300('');
        console.info(`====>TestGetDrawableDescriptorDataByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetDrawableDescriptorDataByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSYMBOL_0100
    * @tc.name      TestGetSymbol0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetSymbol0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetSymbol0100 start====");
        let result: number = nativeTest.GetSymbol0100($r('app.symbol.symbol_test').id);
        console.info(`====>TestGetSymbol0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetSymbol0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSYMBOL_0200
    * @tc.name      TestGetSymbol0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetSymbol0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetSymbol0200 start====");
        let result: number = nativeTest.GetSymbol0200($r('app.symbol.symbol_test').id);
        console.info(`====>TestGetSymbol0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetSymbol0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSYMBOL_0300
    * @tc.name      TestGetSymbol0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetSymbol0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetSymbol0300 start====");
        let result: number = nativeTest.GetSymbol0300(0);
        console.info(`====>TestGetSymbol0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetSymbol0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSYMBOL_0400
    * @tc.name      TestGetSymbol0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetSymbol0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetSymbol0400 start====");
        let result: number = nativeTest.GetSymbol0400($r('app.string.app_name').id);
        console.info(`====>TestGetSymbol0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetSymbol0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSYMBOL_0500
    * @tc.name      TestGetSymbol0500
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetSymbol0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetSymbol0500 start====");
        let result: number = nativeTest.GetSymbol0500($r('app.symbol.symbolTestA').id);
        console.info(`====>TestGetSymbol0500 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetSymbol0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetSymbolByName_0100
    * @tc.name      TestGetSymbolByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetSymbolByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetSymbolByName0100 start====");
        let result: number = nativeTest.GetSymbolByName0100();
        console.info(`====>TestGetSymbolByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetSymbolByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetSymbolByName_0200
    * @tc.name      TestGetSymbolByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetSymbolByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetSymbolByName0200 start====");
        let result: number = nativeTest.GetSymbolByName0200();
        console.info(`====>TestGetSymbolByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetSymbolByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetSymbolByName_0300
    * @tc.name      TestGetSymbolByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetSymbolByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetSymbolByName0300 start====");
        let result: number = nativeTest.GetSymbolByName0300();
        console.info(`====>TestGetSymbolByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetSymbolByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_ResourceManager_GetSymbolByName_0400
    * @tc.name      TestGetSymbolByName0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetSymbolByName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetSymbolByName0400 start====");
        let result: number = nativeTest.GetSymbolByName0400();
        console.info(`====>TestGetSymbolByName0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetSymbolByName0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETLOCALES_0100
    * @tc.name      TestGetLocales0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetLocales0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetLocales0100 start====");
        let result: number = nativeTest.GetLocales0100();
        console.info(`====>TestGetLocales0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetLocales0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETLOCALES_0200
    * @tc.name      TestGetLocales0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetLocales0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetLocales0200 start====");
        let result: number = nativeTest.GetLocales0200();
        console.info(`====>TestGetLocales0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetLocales0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETLOCALESDATA_0100
    * @tc.name      TestGetLocalesData0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetLocalesData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetLocalesData0100 start====");
        let result: number = nativeTest.GetLocalesData0100();
        console.info(`====>TestGetLocalesData0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetLocalesData0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETLOCALESDATA_0200
    * @tc.name      TestGetLocalesData0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetLocalesData0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetLocalesData0200 start====");
        let result: number = nativeTest.GetLocalesData0200();
        console.info(`====>TestGetLocalesData0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetLocalesData0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETCONFIGURATION_0100
    * @tc.name      TestGetConfiguration0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetConfiguration0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetConfiguration0100 start====");
        let result: number = nativeTest.GetConfiguration0100();
        console.info(`====>TestGetConfiguration0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetConfiguration0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETCONFIGURATION_0200
    * @tc.name      TestGetConfiguration0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetConfiguration0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetConfiguration0200 start====");
        let result: number = nativeTest.GetConfiguration0200();
        console.info(`====>TestGetConfiguration0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetConfiguration0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETRESOURCECONFIGURATION_0100
    * @tc.name      TestGetResourceConfiguration0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetResourceConfiguration0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetResourceConfiguration0100 start====");
        let result: number = nativeTest.GetResourceConfiguration0100();
        console.info(`====>TestGetResourceConfiguration0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetResourceConfiguration0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_RELEASECONFIGURATION_0100
    * @tc.name      TestReleaseConfiguration0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestReleaseConfiguration0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestReleaseConfiguration0100 start====");
        let result: number = nativeTest.ReleaseConfiguration0100();
        console.info(`====>TestReleaseConfiguration0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestReleaseConfiguration0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_RELEASECONFIGURATION_0200
    * @tc.name      TestReleaseConfiguration0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestReleaseConfiguration0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestReleaseConfiguration0200 start====");
        let result: number = nativeTest.ReleaseConfiguration0200();
        console.info(`====>TestReleaseConfiguration0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestReleaseConfiguration0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRING_0100
    * @tc.name      TestGetString0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetString0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetString0100 start====");
        let result: number = nativeTest.GetString0100($r('app.string.entry_MainAbility').id);
        console.info(`====>TestGetString0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetString0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRING_0200
    * @tc.name      TestGetString0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetString0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetString0200 start====");
        let result: number = nativeTest.GetString0200($r('app.string.entry_MainAbility').id);
        console.info(`====>TestGetString0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetString0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRING_0300
    * @tc.name      TestGetString0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetString0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetString0300 start====");
        let result: number = nativeTest.GetString0300(0);
        console.info(`====>TestGetString0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetString0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRING_0400
    * @tc.name      TestGetString0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetString0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetString0400 start====");
        let result: number = nativeTest.GetString0400($r('app.media.icon').id);
        console.info(`====>TestGetString0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetString0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRING_0500
    * @tc.name      TestGetString0500
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetString0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetString0500 start====");
        let result: number = nativeTest.GetString0500($r('app.string.symbol_A_ref').id);
        console.info(`====>TestGetString0500 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetString0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGBYNAME_0100
    * @tc.name      TestGetStringByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringByName0100 start====");
        let result: number = nativeTest.GetStringByName0100();
        console.info(`====>TestGetStringByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetStringByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGBYNAME_0200
    * @tc.name      TestGetStringByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringByName0200 start====");
        let result: number = nativeTest.GetStringByName0200();
        console.info(`====>TestGetStringByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetStringByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGBYNAME_0300
    * @tc.name      TestGetStringByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringByName0300 start====");
        let result: number = nativeTest.GetStringByName0300();
        console.info(`====>TestGetStringByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetStringByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGBYNAME_0400
    * @tc.name      TestGetStringByName0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringByName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringByName0400 start====");
        let result: number = nativeTest.GetStringByName0400();
        console.info(`====>TestGetStringByName0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetStringByName0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGARRAY_0100
    * @tc.name      TestGetStringArray0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringArray0100 start====");
        let result: number = nativeTest.GetStringArray0100($r('app.strarray.size').id);
        console.info(`====>TestGetStringArray0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetStringArray0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGARRAY_0200
    * @tc.name      TestGetStringArray0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringArray0200 start====");
        let result: number = nativeTest.GetStringArray0200($r('app.strarray.size').id);
        console.info(`====>TestGetStringArray0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetStringArray0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGARRAY_0300
    * @tc.name      TestGetStringArray0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringArray0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringArray0300 start====");
        let result: number = nativeTest.GetStringArray0300(0);
        console.info(`====>TestGetStringArray0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetStringArray0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGARRAY_0400
    * @tc.name      TestGetStringArray0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringArray0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringArray0400 start====");
        let result: number = nativeTest.GetStringArray0400($r('app.media.icon').id);
        console.info(`====>TestGetStringArray0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetStringArray0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGARRAY_0500
    * @tc.name      TestGetStringArray0500
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringArray0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringArray0500 start====");
        let result: number = nativeTest.GetStringArray0500($r('app.strarray.array1').id);
        console.info(`====>TestGetStringArray0500 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetStringArray0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGARRAYBYNAME_0100
    * @tc.name      TestGetStringArrayByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringArrayByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringArrayByName0100 start====");
        let result: number = nativeTest.GetStringArrayByName0100();
        console.info(`====>TestGetStringArrayByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetStringArrayByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGARRAYBYNAME_0200
    * @tc.name      TestGetStringArrayByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringArrayByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringArrayByName0200 start====");
        let result: number = nativeTest.GetStringArrayByName0200();
        console.info(`====>TestGetStringArrayByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetStringArrayByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGARRAYBYNAME_0300
    * @tc.name      TestGetStringArrayByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringArrayByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringArrayByName0300 start====");
        let result: number = nativeTest.GetStringArrayByName0300();
        console.info(`====>TestGetStringArrayByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetStringArrayByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETSTRINGARRAYBYNAME_0400
    * @tc.name      TestGetStringArrayByName0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetStringArrayByName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetStringArrayByName0400 start====");
        let result: number = nativeTest.GetStringArrayByName0400();
        console.info(`====>TestGetStringArrayByName0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetStringArrayByName0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_RELEASESTRINGARRAY_0100
    * @tc.name      TestReleaseStringArray0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestReleaseStringArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestReleaseStringArray0100 start====");
        let result: number = nativeTest.ReleaseStringArray0100();
        console.info(`====>TestReleaseStringArray0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestReleaseStringArray0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_RELEASESTRINGARRAY_0200
    * @tc.name      TestReleaseStringArray0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestReleaseStringArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestReleaseStringArray0200 start====");
        let result: number = nativeTest.ReleaseStringArray0200();
        console.info(`====>TestReleaseStringArray0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestReleaseStringArray0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETPLURALSTRING_0100
    * @tc.name      TestGetPluralString0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetPluralString0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetPluralString0100 start====");
        let result: number = nativeTest.GetPluralString0100($r('app.plural.eat_apple').id);
        console.info(`====>TestGetPluralString0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetPluralString0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETPLURALSTRING_0200
    * @tc.name      TestGetPluralString0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetPluralString0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetPluralString0200 start====");
        let result: number = nativeTest.GetPluralString0200($r('app.plural.eat_apple').id);
        console.info(`====>TestGetPluralString0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetPluralString0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETPLURALSTRING_0300
    * @tc.name      TestGetPluralString0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetPluralString0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetPluralString0300 start====");
        let result: number = nativeTest.GetPluralString0300(0);
        console.info(`====>TestGetPluralString0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_ID_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetPluralString0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETPLURALSTRING_0400
    * @tc.name      TestGetPluralString0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetPluralString0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetPluralString0400 start====");
        let result: number = nativeTest.GetPluralString0400($r('app.media.icon').id);
        console.info(`====>TestGetPluralString0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NOT_FOUND_BY_ID);
        done()
      } catch (err) {
        console.error("====>TestGetPluralString0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETPLURALSTRING_0500
    * @tc.name      TestGetPluralString0500
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetPluralString0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetPluralString0500 start====");
        let result: number = nativeTest.GetPluralString0500($r('app.plural.test_cyc').id);
        console.info(`====>TestGetPluralString0500 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetPluralString0500 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETPLURALSTRINGBYNAME_0100
    * @tc.name      TestGetPluralStringByName0100
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetPluralStringByName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetPluralStringByName0100 start====");
        let result: number = nativeTest.GetPluralStringByName0100();
        console.info(`====>TestGetPluralStringByName0100 result====${result}`);
        expect(result).assertEqual(SUCCESS);
        done()
      } catch (err) {
        console.error("====>TestGetPluralStringByName0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETPLURALSTRINGBYNAME_0200
    * @tc.name      TestGetPluralStringByName0200
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetPluralStringByName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetPluralStringByName0200 start====");
        let result: number = nativeTest.GetPluralStringByName0200();
        console.info(`====>TestGetPluralStringByName0200 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_INVALID_INPUT_PARAMETER);
        done()
      } catch (err) {
        console.error("====>TestGetPluralStringByName0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETPLURALSTRINGBYNAME_0300
    * @tc.name      TestGetPluralStringByName0300
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetPluralStringByName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetPluralStringByName0300 start====");
        let result: number = nativeTest.GetPluralStringByName0300();
        console.info(`====>TestGetPluralStringByName0300 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_NAME_NOT_FOUND);
        done()
      } catch (err) {
        console.error("====>TestGetPluralStringByName0300 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
    * @tc.number    SUB_GLOBAL_OH_RESOURCEMANAGER_GETPLURALSTRINGBYNAME_0400
    * @tc.name      TestGetPluralStringByName0400
    * @tc.desc      overriding error code
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('TestGetPluralStringByName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TestGetPluralStringByName0400 start====");
        let result: number = nativeTest.GetPluralStringByName0400();
        console.info(`====>TestGetPluralStringByName0400 result====${result}`);
        expect(result).assertEqual(ERROR_CODE_RES_REF_TOO_MUCH);
        done()
      } catch (err) {
        console.error("====>TestGetPluralStringByName0400 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

  })
}