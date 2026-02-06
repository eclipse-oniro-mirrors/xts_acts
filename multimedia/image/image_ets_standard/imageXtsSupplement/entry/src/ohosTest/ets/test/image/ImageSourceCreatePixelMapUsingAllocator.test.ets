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

import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';
import { JSON } from '@kit.ArkTS';

const TAG = LOG_TAG + 'createPixelMapUsingAllocator.xts ';
let decodingOptions: image.DecodingOptions = {
  editable: true,
  desiredSize: { width: 3072, height: 4096 },
  rotate: 0,
  desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
  desiredRegion: { size: { width: 3072, height: 4096 }, x: 0, y: 0 },
  cropAndScaleStrategy: image.CropAndScaleStrategy.CROP_FIRST,
  index: 0
};
let imageSourceApi: image.ImageSource;

async function ImageSourceCreateTest(done: Function, testName: string, pathUri: string,
  callback: (imageSourceApi: image.ImageSource) => void) {
  console.info(TAG, testName, 'Start ImageSourceCreateTest');
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let path = `file://${testContext.filesDir}/${pathUri}`;
  imageSourceApi = image.createImageSource(path);
  if (imageSourceApi != undefined) {
    console.info(TAG, testName, 'Success createImageSource');
    callback(imageSourceApi);
    return;
  }
  console.info(TAG, testName, 'Failed createImageSource');
  expect().assertFail();
  done();
}

export default function ImageSourceCreatePixelMapUsingAllocatorTest() {
  describe('ImageSourceCreatePixelMapUsingAllocatorTest', () => {
    beforeAll(() => {
      console.info(TAG, 'beforeAll case.');
    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll( async() => {
      if (imageSourceApi != undefined) {
        await imageSourceApi.release();
      }
      console.info(TAG, 'afterAll case.');
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0100
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0100';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator DMA');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0200
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0200';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator AUTO');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0400';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0500';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0600';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0700';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_0800';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0300
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0300
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0300';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0400';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0500';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0600';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0700';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0800';
      const path = 'test.jpg';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_0100
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_0100';
      const path = 'test.jpg';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(null)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_0200
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_0200';
      const path = 'test.jpg';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(undefined)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_0100';
      const path = 'test.jpg';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(null)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_0200';
      const path = 'test.jpg';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_0100';
      const path = 'test.jpg';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        });
        console.info(TAG, testName, 'Success createPixelMapList');
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_0200';
      const path = 'test.jpg';
      console.info(TAG, testName, 'Start ');
      await ImageSourceCreateTest(done, testName, path, async (imageSourceApi) => {
        try {
          await imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed createPixelMapList', error, error.code);
          expect(error.code).assertEqual(401)
          done();
        }
      });
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0100
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0100';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator DMA');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0200
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0200';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator AUTO');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0400';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0500';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0600';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0700';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_PNG_0800';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0300
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0300
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0300';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0400';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0500';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0600';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0700';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_PNG_0800';
      const path = 'test.png';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_PNG_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_PNG_0100
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_PNG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_PNG_0100';
      const path = 'test.png';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(null)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_PNG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_PNG_0200
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_PNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_PNG_0200';
      const path = 'test.png';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(undefined)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_PNG_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_PNG_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_PNG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_PNG_0100';
      const path = 'test.png';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(null)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_PNG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_PNG_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_PNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_PNG_0200';
      const path = 'test.png';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_PNG_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_PNG_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_PNG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_PNG_0100';
      const path = 'test.png';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        });
        console.info(TAG, testName, 'Success createPixelMapList');
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_PNG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_PNG_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_PNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_PNG_0200';
      const path = 'test.png';
      console.info(TAG, testName, 'Start ');
      await ImageSourceCreateTest(done, testName, path, async (imageSourceApi) => {
        try {
          await imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed createPixelMapList', error, error.code);
          expect(error.code).assertEqual(401)
          done();
        }
      });
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0100
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0100';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator DMA');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0200
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0200';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator AUTO');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0400';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0500';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0600';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0700';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_GIF_0800';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0300
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0300
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0300';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0400';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0500';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0600';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0700';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_GIF_0800';
      const path = 'test.gif';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_GIF_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_GIF_0100
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_GIF_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_GIF_0100';
      const path = 'test.gif';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(null)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_GIF_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_GIF_0200
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_GIF_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_GIF_0200';
      const path = 'test.gif';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(undefined)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_GIF_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_GIF_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_GIF_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_GIF_0100';
      const path = 'test.gif';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(null)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_GIF_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_GIF_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_GIF_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_GIF_0200';
      const path = 'test.gif';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_GIF_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_GIF_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_GIF_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_GIF_0100';
      const path = 'test.gif';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        });
        console.info(TAG, testName, 'Success createPixelMapList');
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_GIF_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_GIF_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_GIF_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_GIF_0200';
      const path = 'test.gif';
      console.info(TAG, testName, 'Start ');
      await ImageSourceCreateTest(done, testName, path, async (imageSourceApi) => {
        try {
          await imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed createPixelMapList', error, error.code);
          expect(error.code).assertEqual(401)
          done();
        }
      });
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0100
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0100';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator DMA');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0200
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0200';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator AUTO');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0400';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0500';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0600';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0700';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_BMP_0800';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0300
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0300
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0300';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0400';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0500';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0600';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0700';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_BMP_0800';
      const path = 'test8.bmp';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_BMP_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_BMP_0100
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_BMP_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_BMP_0100';
      const path = 'test8.bmp';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(null)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_BMP_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_BMP_0200
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_BMP_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_BMP_0200';
      const path = 'test8.bmp';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(undefined)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_BMP_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_BMP_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_BMP_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_BMP_0100';
      const path = 'test8.bmp';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(null)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_BMP_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_BMP_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_BMP_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_BMP_0200';
      const path = 'test8.bmp';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_BMP_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_BMP_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_BMP_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_BMP_0100';
      const path = 'test8.bmp';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        });
        console.info(TAG, testName, 'Success createPixelMapList');
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_BMP_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_BMP_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_BMP_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_BMP_0200';
      const path = 'test8.bmp';
      console.info(TAG, testName, 'Start ');
      await ImageSourceCreateTest(done, testName, path, async (imageSourceApi) => {
        try {
          await imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed createPixelMapList', error, error.code);
          expect(error.code).assertEqual(401)
          done();
        }
      });
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0100
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0100';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator DMA');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0200
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0200';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator AUTO');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0400';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0500';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0600';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0700';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_WEBP_0800';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0300
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0300
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0300';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0400';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0500';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0600';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0700';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_WEBP_0800';
      const path = 'test.webp';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_WEBP_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_WEBP_0100
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_WEBP_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_WEBP_0100';
      const path = 'test.webp';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(null)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_WEBP_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_WEBP_0200
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_WEBP_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_WEBP_0200';
      const path = 'test.webp';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(undefined)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_WEBP_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_WEBP_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_WEBP_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_WEBP_0100';
      const path = 'test.webp';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(null)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_WEBP_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_WEBP_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_WEBP_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_WEBP_0200';
      const path = 'test.webp';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_WEBP_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_WEBP_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_WEBP_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_WEBP_0100';
      const path = 'test.webp';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        });
        console.info(TAG, testName, 'Success createPixelMapList');
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_WEBP_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_WEBP_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_WEBP_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_WEBP_0200';
      const path = 'test.webp';
      console.info(TAG, testName, 'Start ');
      await ImageSourceCreateTest(done, testName, path, async (imageSourceApi) => {
        try {
          await imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed createPixelMapList', error, error.code);
          expect(error.code).assertEqual(401)
          done();
        }
      });
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0100
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0100';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator DMA');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0200
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0200';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator AUTO');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0400';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0500';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0600';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0700';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_DNG_0800';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0300
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0300
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0300';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0400';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0500';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0600';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0700';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_DNG_0800';
      const path = 'test_dng.dng';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_DNG_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_DNG_0100
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_DNG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_DNG_0100';
      const path = 'test_dng.dng';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(null)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_DNG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_DNG_0200
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_DNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_DNG_0200';
      const path = 'test_dng.dng';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(undefined)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_DNG_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_DNG_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_DNG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_DNG_0100';
      const path = 'test_dng.dng';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(null)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_DNG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_DNG_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_DNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_DNG_0200';
      const path = 'test_dng.dng';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_DNG_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_DNG_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_DNG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_DNG_0100';
      const path = 'test_dng.dng';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        });
        console.info(TAG, testName, 'Success createPixelMapList');
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_DNG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_DNG_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_DNG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_DNG_0200';
      const path = 'test_dng.dng';
      console.info(TAG, testName, 'Start ');
      await ImageSourceCreateTest(done, testName, path, async (imageSourceApi) => {
        try {
          await imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed createPixelMapList', error, error.code);
          expect(error.code).assertEqual(401)
          done();
        }
      });
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0200
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0200';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator AUTO');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0400';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0500';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0600';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0700';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SVG_0800';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0300
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0300
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0300';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0400';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0500';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0600';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0700';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_SVG_0800';
      const path = 'test.svg';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_SVG_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_SVG_0100
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_SVG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_SVG_0100';
      const path = 'test.svg';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(null)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_SVG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_SVG_0200
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_SVG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_SVG_0200';
      const path = 'test.svg';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(undefined)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_SVG_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_SVG_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_SVG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_SVG_0100';
      const path = 'test.svg';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(null)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_SVG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_SVG_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_SVG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_SVG_0200';
      const path = 'test.svg';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_SVG_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_SVG_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_SVG_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_SVG_0100';
      const path = 'test.svg';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        });
        console.info(TAG, testName, 'Success createPixelMapList');
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_SVG_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_SVG_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_SVG_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_SVG_0200';
      const path = 'test.svg';
      console.info(TAG, testName, 'Start ');
      await ImageSourceCreateTest(done, testName, path, async (imageSourceApi) => {
        try {
          await imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed createPixelMapList', error, error.code);
          expect(error.code).assertEqual(401)
          done();
        }
      });
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0100
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0100';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator DMA');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0200
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0200';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodingOptions, allocatorType)
          expect(pixelmap != undefined).assertTrue();
          console.info(TAG, testName, 'Succeeded createPixelMapUsingAllocator AUTO');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', error);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0400';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0500';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0600';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0700';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocator
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_ICO_0800';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocator(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocator');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocator', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0300
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0300
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0300';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0400
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0400
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0400';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0500
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0500
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0500';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0600
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0600
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0600';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(null, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0700
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0700
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0700';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0800
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0800
     * @tc.desc    imageSource_createPixelMapUsingAllocatorSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ICO_0800';
      const path = 'test.ico';
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapUsingAllocatorSync(undefined, allocatorType)
        });
        console.info(TAG, testName, 'Success createPixelMapUsingAllocatorSync');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapUsingAllocatorSync', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401')
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_ICO_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_ICO_0100
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_ICO_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_ICO_0100';
      const path = 'test.ico';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(null)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_ICO_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_ICO_0200
     * @tc.desc    imageSource_createPixelMapSync
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_ICO_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_SYNC_ICO_0200';
      const path = 'test.ico';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapSync(undefined)
          console.info(TAG, testName, 'Success createPixelMapSync');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapSync', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_ICO_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_ICO_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_ICO_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_ICO_0100';
      const path = 'test.ico';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(null)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_ICO_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_ICO_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_ICO_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_ICO_0200';
      const path = 'test.ico';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined)
          console.info(TAG, testName, 'Success createPixelMapList');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_ICO_0100
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_ICO_0100
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_ICO_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_ICO_0100';
      const path = 'test.ico';
      try {
        console.info(TAG, testName, 'Start ');
        await ImageSourceCreateTest(done, testName, path, (imageSourceApi) => {
          imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        });
        console.info(TAG, testName, 'Success createPixelMapList');
      } catch (error) {
        console.error(TAG, testName, 'Failed createPixelMapList', JSON.stringify(error), error.code);
        expect(error).assertFail()
        done();
      }
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_ICO_0200
     * @tc.name    SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_ICO_0200
     * @tc.desc    imageSource_createPixelMapList
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_ICO_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_CREATE_PIXEL_MAP_LIST_CALLBACK_ICO_0200';
      const path = 'test.ico';
      console.info(TAG, testName, 'Start ');
      await ImageSourceCreateTest(done, testName, path, async (imageSourceApi) => {
        try {
          await imageSourceApi.createPixelMapList(undefined, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to create pixelMapList object, error code is ${err}`);
              done();
            } else {
              console.info(TAG, testName, 'Succeeded in creating pixelMapList object.');
              done();
            }
          });
        } catch (error) {
          console.error(TAG, testName, 'Failed createPixelMapList', error, error.code);
          expect(error.code).assertEqual(401)
          done();
        }
      });
    })
  })
}