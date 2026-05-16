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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { initialize } from './AbilityContextHelper.test';
import { BusinessError } from '@ohos.base';

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

export default function ImageCreator() {
  describe('ImageCreator', (): void => {
    let filesDir: string | undefined | null;
    const JPEG: image.ComponentType = image.ComponentType.JPEG;
    const WIDTH: int = 8192;
    const HEIGHT: int = 8;
    const SIZE: image.Size = { height: HEIGHT, width: WIDTH }
    const FORMAT: image.ImageFormat = image.ImageFormat.JPEG;
    const CAPACITY: int = 8;

    let globalCreator: image.ImageCreator | undefined = undefined;
    let globalImg: image.Image | undefined = undefined;
    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
    })

    afterEach(async () => {
      if (globalImg != undefined) {
        console.info("globalImg release start");
        try {
          await globalImg!.release();
        } catch (error) {
          console.info("globalImg release fail");
        }
      }
      if (globalCreator != undefined) {
        console.info('globalCreator release start');
        try {
          await globalCreator!.release();
        } catch (error) {
          console.info('globalCreator release fail');
        }
      }
      console.info('afterEach case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_PROMISE_STATIC_0100
     * @tc.desc   release-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_PROMISE_STATIC_0100");
      let creator = image.createImageCreator(SIZE, FORMAT, CAPACITY);
      if (creator != undefined) {
        try {
          creator.release();
          logger.log('creator release success');
          done();
        } catch (error: BusinessError) {
          logger.log('creator release failed error.code: ' + error.code);
          expect(false).assertTrue();
          done();
        }
      } else {
        logger.log('creator release finished');
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_CALLBACK_STATIC_0100
     * @tc.desc   release-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATOR_RELEASE_CALLBACK_STATIC_0100");
      let creator = image.createImageCreator(SIZE, FORMAT, CAPACITY);
      if (creator != undefined) {
        creator.release((err: BusinessError | null) => {
          if (err && err.code) {
            logger.log('creator release failed error.code: ' + err.code);
            expect(false).assertTrue();
            done();
          }
          logger.log('creator release call back success');
          done();
        });
      } else {
        logger.log('creator release finished');
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_STATIC_0100
     * @tc.desc   dequeueImage-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let creator = image.createImageCreator(SIZE, FORMAT, CAPACITY);
      if (creator != undefined) {
        globalCreator = creator;
        try {
          let img = await creator.dequeueImage();
          console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_STATIC_0100 dequeueImage Success');
          expect(img != undefined).assertTrue();
          globalImg = img;
          done();
        } catch (error: BusinessError) {
          console.log('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_STATIC_0100 error: ' + error);
          expect(false).assertTrue();
          done();
        }
      } else {
        expect(false).assertTrue();
        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_PROMISE_STATIC_0100 finished');
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_STATIC_0100
     * @tc.desc   dequeueImage-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let creator = image.createImageCreator(SIZE, FORMAT, CAPACITY);
      if (creator != undefined) {
        globalCreator = creator;
        creator.dequeueImage((err: BusinessError | null, img) => {
          if (err && err.code) {
            console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_STATIC_0100 err:' + err);
            expect(false).assertTrue();
            done();
          }
          console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_STATIC_0100 dequeueImage call back Success');
          expect(img != undefined).assertTrue();
          globalImg = img!;
          done();
        });
      } else {
        expect(false).assertTrue();
        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUEIMAGE_CALLBACK_STATIC_0100 finished');
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_STATIC_0200
     * @tc.desc   queueImage-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let creator = image.createImageCreator(SIZE, FORMAT, CAPACITY);
      if (creator != undefined) {
        globalCreator = creator;
        try {
          let img = await creator.dequeueImage();
          if (img == undefined) {
            expect(false).assertTrue();
            done();
          }
          globalImg = img;
          try {
            let component = await img!.getComponent(JPEG);
            expect(component!.componentType == JPEG).assertTrue();
            expect(component!.byteBuffer != undefined).assertTrue();

            console.info("this is img " + img);
            try {
              await creator.queueImage(img);
              console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_STATIC_0200 queueImage Success');
              // creator.test;
              done();
            } catch (error: BusinessError) {
              console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_STATIC_0200 queueImage error: ' + error);
              expect(false).assertTrue();
              done();
            }
          } catch (error: BusinessError) {
            expect(false).assertTrue();
            console.log('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_STATIC_0200 getComponent error:' + error);
            done();
          }
        } catch (error: BusinessError) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_STATIC_0200 dequeueImage error: ' + error);
          expect(false).assertTrue();
          done();
        }
      } else {
        expect(false).assertTrue();
        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_PROMISE_STATIC_0200 createImageCreator failed');
        done()
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_STATIC_0200
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_STATIC_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let creator = image.createImageCreator(SIZE, FORMAT, CAPACITY);
      if (creator != undefined) {
        globalCreator = creator;
        creator.dequeueImage((err: BusinessError | null, img) => {
          if (err && err.code) {
            console.log('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_STATIC_0200 dequeueImage error:' + err);
            expect(false).assertTrue();
            done();
          }
          globalImg = img!;
          img!.getComponent(JPEG, (err: BusinessError | null, component) => {
            if (err && err.code) {
              expect(false).assertTrue();
              console.log('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_STATIC_0200 getComponent error:' + err);
              done();
            }
            expect(component!.componentType == JPEG).assertTrue();
            expect(component!.byteBuffer != undefined).assertTrue();

            console.info("this is img " + img!);
            creator.queueImage(img!, (err: BusinessError|null) => {
              if (err && err.code) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_STATIC_0200 queueImage err: ' + err);
                expect(false).assertTrue();
                done();
              }
              console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_STATIC_0200 queueImage Success');
              // creator.test;
              done();

            })
          })
        })
      } else {
        expect(false).assertTrue();
        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_QUEUEIMAGE_CALLBACK_STATIC_0200 createImageCreator failed');
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_STATIC_0100
     * @tc.desc   on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let creator = image.createImageCreator(SIZE, FORMAT, CAPACITY);
      expect(creator != undefined).assertTrue();
      if (creator == undefined) {
        expect(false).assertTrue();
        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_STATIC_0100 create image creator failed');
        done();
      }
      globalCreator = creator;
      creator.onImageRelease((err: BusinessError | null) => {
        if (err && err.code) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_STATIC_0100 on release faild' + err);
          expect(false).assertTrue();
          done();
        } else {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_STATIC_0100 on call back IN');
          done();
        }
      })
      creator.dequeueImage((err: BusinessError | null, img) => {
        if (err && err.code) {
          console.log('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_STATIC_0100 dequeueImage error:' + err);
          expect(false).assertTrue();
          done();
        }
        globalImg = img!;
        img!.getComponent(JPEG, (err: BusinessError | null, component) => {
          if (err && err.code) {
            expect(false).assertTrue();
            console.log('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_STATIC_0100 getComponent error:' + err);
            done();
          }
          expect(component!.componentType == JPEG).assertTrue();
          expect(component!.byteBuffer != undefined).assertTrue();

          console.info("this is img " + img!);
          creator.queueImage(img!, (err: BusinessError | null) => {
            if (err && err.code) {
              console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_STATIC_0100 queueImage err: ' + err);
              expect(false).assertTrue();
              done();
            }
            console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_STATIC_0100 queueImage Success');
            // creator.test;
            done();

          })
        })
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_STATIC_0100
     * @tc.desc   imageCreator-off-'imageRelease'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_STATIC_0100 start');
      let creator = image.createImageCreator(SIZE, FORMAT, CAPACITY);
      let registered = false;
      expect(creator != undefined).assertTrue();
      if (creator == undefined) {
        expect(false).assertTrue();
        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_STATIC_0100 create image creator failed');
        done();
      }
      globalCreator = creator;
      try {
        creator.offImageRelease();
        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_STATIC_0100 off success');
        registered = true;
      } catch (error: BusinessError) {
        console.info('SUB_MULTIMEDIA_IMAGE_CREATOR_OFF_SUCCESS_STATIC_0100 off failed');
      }
      expect(registered).assertTrue();
      done();
    })

  })
}

