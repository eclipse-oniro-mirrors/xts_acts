/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
import MediaTestBase from "./MediaTestBase";
import { HashMap } from "@kit.ArkTS";
import { LOG_TAG, MAX_COUNT, SLEEP_TIME_200 } from "../Constants";
import { fileIo as fs } from '@kit.CoreFileKit';
import { sleep } from "../common";

const TAG = LOG_TAG + 'MediaSourceLoadingRequestTest';
const VIDEO_SOURCE = 'H264_AAC.mp4';
const FILE_LENGTH = 1894335;

let mediaTestBase = new MediaTestBase();
let fileDescriptor: media.AVFileDescriptor;
let mMediaSource: media.MediaSource | undefined;
let uuid: number = 0;
let requests: HashMap<number, media.MediaSourceLoadingRequest> = new HashMap();
let resourceLoader: media.MediaSourceLoader;
const URL_TO_HEADER: Record<string, Record<string, string>> =
  { "https://xxx/xx.mp4": { "content-length": "1894335" } };

interface PreDownConfig {
  url: string,
  playTime: number, // Used to PLAYING_EVENT, -1 means wait for end callback
  respondDataCount: number, // test for finishLoading
  needHeader: boolean,
  loadingError?: number
}

function openFileFailed() {
  console.info(TAG, 'openFileFailed case file fail');
}

async function initResourceLoader(config: PreDownConfig, done: Function, testName: string) {
  console.info(TAG, testName + ' begin.');
  resourceLoader = {
    open: (request: media.MediaSourceLoadingRequest) => {
      if (!request) {
        console.error(TAG, testName + ' request is null');
        expect().assertFail();
      }
      uuid += 1;
      requests.set(uuid, request);
      return uuid;
    },
    read: (uuid: number, requestedOffset: number, requestedLength: number) => {
      if (!requests.hasKey(uuid)) {
        console.info(TAG, testName + ' uuid not find');
        return;
      }
      if (config.needHeader) {
        respondHeader(uuid, config, testName);
      }
      if (config.respondDataCount == 0) {
        finishLoading(uuid, config, testName);
      } else {
        config.respondDataCount -= 1;
        if (config.loadingError == media.LoadingRequestError.LOADING_ERROR_NOT_READY) {
          finishLoading(uuid, config, testName);
          config.loadingError = 0;
          return;
        }
        respondData(uuid, requestedOffset, requestedLength, testName);
        if (requestedOffset + requestedLength == FILE_LENGTH &&
          config.loadingError == media.LoadingRequestError.LOADING_ERROR_SUCCESS) {
          finishLoading(uuid, config, testName);
        }
      }
    },
    close: (uuid: number) => {
      requests.remove(uuid);
      config.needHeader = true;
    }
  }
  mMediaSource = media.createMediaSourceWithUrl(config.url);
  mMediaSource.setMediaResourceLoaderDelegate(resourceLoader);
  await sleep(SLEEP_TIME_200);
  done();
}

async function respondHeader(uuid: number, config: PreDownConfig, testName: string) {
  let request = requests.get(uuid);
  if (request) {
    let url = request.url;
    let header = URL_TO_HEADER[url];
    console.info(TAG, testName + 'case in respondHeader');
    request.respondHeader(uuid, header);
    config.needHeader = false;
  }
}

async function respondData(uuid: number, offset: number, length: number, testName: string) {
  let request = requests.get(uuid);
  if (request) {
    let buf = new ArrayBuffer(length);
    if (fileDescriptor) {
      console.info(TAG, testName + ' offset' + fileDescriptor.offset + ', length:' + fileDescriptor.length);
      let num: number =
        fs.readSync(fileDescriptor.fd, buf, { offset: fileDescriptor.offset! + offset, length: length });
      console.info(TAG, testName + ' respondData uuid: ' + uuid + ', num: ' + num);
      request.respondData(uuid, offset, buf);
    }
  }
}

async function finishLoading(uuid: number, config: PreDownConfig, testName: string) {
  let request = requests.get(uuid);
  if (request) {
    console.info(TAG, testName + 'case in finishLoading loadingError:' + config.loadingError);
    request.finishLoading(uuid, config.loadingError);
  }
}

export default function MediaSourceLoadingRequestTest() {
  describe('MediaSourceLoadingRequestTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res) => {
        fileDescriptor = res;
      });
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
      await mediaTestBase.closeFdNumber(fileDescriptor.fd);
    });

    /**
     * @tc.name   initResourceLoader_001
     * @tc.number MEDIA_SOURCE_LOADING_REQUEST_TEST_001
     * @tc.desc   initResourceLoader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('initResourceLoader_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'initResourceLoader_001';
      let config: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: MAX_COUNT
      };
      await initResourceLoader(config, done, testName);
    })
  })
}