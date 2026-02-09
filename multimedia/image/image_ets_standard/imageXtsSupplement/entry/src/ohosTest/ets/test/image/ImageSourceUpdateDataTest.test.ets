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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { image } from "@kit.ImageKit";
import { common } from "@kit.AbilityKit";
import { BusinessError } from '@kit.BasicServicesKit';


const TAG = 'ImageSource.UpdateDataTest';
async function UpdateDatay(done: Function, testName: string, buf:	ArrayBuffer,isFinished:boolean,offset:number,length:number,callback?: (res:image.AuxiliaryPicture | null) => void,
) {
  try {
    let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let basePath = context.filesDir;
    let filePath = basePath + '/' + 'test_exif_v2.jpg';
    let imageSourceObj: image.ImageSource = image.createImageSource(filePath);
    imageSourceObj.updateData(buf, isFinished, offset, length).then(() => {
      console.info(TAG,testName,'Succeeded in updating data.');
    }).catch((err: BusinessError) => {
      console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
    })
    done();
  }catch (error) {
    console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
    expect().assertFail();
    done();
  }
}
async function UpdateDatayCallback(done: Function, testName: string, buf:	ArrayBuffer,isFinished:boolean,offset:number,length:number,callback?: (res:image.AuxiliaryPicture | null) => void,
) {
  try {
    let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let basePath = context.filesDir;
    let filePath = basePath + '/' + 'test_exif_v2.jpg';
    let imageSourceObj: image.ImageSource = image.createImageSource(filePath);
    imageSourceObj.updateData(buf, isFinished, offset, length, (err: BusinessError) => {
      if (err) {
        console.error(`Failed to update data.code is ${err.code},message is ${err.message}`);
      } else {
        console.info(TAG,testName,'Succeeded in updating data.');
      }
    done();
    })
  }catch (error) {
    console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
    expect().assertFail();
    done();
  }
}

export default function UpdateDataTest() {
  describe('UpdateDataTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('testString', 'abc');
      AppStorage.setOrCreate('testArray', [-1, 0, 1]);

    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(async () => {
      AppStorage.delete('testString');
      AppStorage.delete('testArray');
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_001
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_001
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_001';
      AppStorage.setOrCreate('key', null);
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatay(done, testName, buf,true, 1,2,(res:image.AuxiliaryPicture | null) => {
        console.info(TAG,testName,'SUCCEED')
        expect(Error).assertUndefined();
        done();
      });
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_002
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_002
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_002';
      AppStorage.setOrCreate('key', undefined);
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatay(done, testName, buf,true, 1,2,(res:image.AuxiliaryPicture | null) => {
        expect(Error).assertUndefined();
        done();
      });
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_003
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_003
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_003';
      AppStorage.setOrCreate('key', '');
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatay(done, testName, buf,true, 1,2,(res:image.AuxiliaryPicture | null) => {
        expect(Error).assertUndefined();
        done();
      });
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_004
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_004
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_004';
      AppStorage.setOrCreate('key', null);
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatay(done, testName, buf,false, 1,2,(res:image.AuxiliaryPicture | null) => {
        expect(Error).assertUndefined();
        done();
      });
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_005
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_005
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_005';
      AppStorage.setOrCreate('key', undefined);
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatay(done, testName, buf,false, 1,2,(res:image.AuxiliaryPicture | null) => {
        expect(Error).assertUndefined();
        done();
      });
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_006
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_006
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_006';
      AppStorage.setOrCreate('key', '');
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatay(done, testName, buf,false, 1,2,(res:image.AuxiliaryPicture | null) => {
        expect(Error).assertUndefined();
        done();
      });
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_007
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_007
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_007';
      AppStorage.setOrCreate('key', null);
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatayCallback(done, testName, buf,true, 1,2,(res:image.AuxiliaryPicture | null) => {
        expect(Error).assertUndefined();
        done();
      });
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_008
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_008
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_008';
      AppStorage.setOrCreate('key', undefined);
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatayCallback(done, testName, buf,true, 1,2,(res:image.AuxiliaryPicture | null) => {
        expect(Error).assertUndefined();
        done();
      });
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_009
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_009
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_009';
      AppStorage.setOrCreate('key', '');
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatayCallback(done, testName, buf,true, 1,2,(res:image.AuxiliaryPicture | null) => {
        expect(Error).assertUndefined();
        done();
      });
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0010
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0010
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0010';
      AppStorage.setOrCreate('key', null);
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatayCallback(done, testName, buf,false, 1,2,(res:image.AuxiliaryPicture | null) => {
        expect(Error).assertUndefined();
        done();
      });
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0011
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0011
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0011';
      AppStorage.setOrCreate('key', undefined);
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatayCallback(done, testName, buf,false, 1,2,(res:image.AuxiliaryPicture | null) => {
        expect(Error).assertUndefined();
        done();
      });
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0012
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0012
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_OVERWRITE_NULL_0012';
      AppStorage.setOrCreate('key', '');
      let buf:ArrayBuffer = AppStorage.get('key') as ESObject;
      await UpdateDatayCallback(done, testName, buf,false, 1,2,(res:image.AuxiliaryPicture | null) => {
        expect(Error).assertUndefined();
        done();
      });
    })
  })
}