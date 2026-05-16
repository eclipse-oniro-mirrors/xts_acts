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
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

const DEFAULT_TAG = 'ActsQosManagerTest';

export default class Utils {
  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }


  static createDirSync(dirPath: string) {
    try {
      if (!fs.accessSync(dirPath)) {
        fs.mkdirSync(dirPath);
        console.log(`[create_dir] ${dirPath} created successfully`);
      } else {
        console.log(`[create_dir] ${dirPath} already exists`);
      }
    } catch (error) {
      console.error(`[create_dir] Failed to create ${dirPath}: ${error}`);
    }
  }

  static copyRawfileToFilesDirSync(rawfileName: string, context: Context, targetSubPath?: string) {
    let dir = context.filesDir + "/";
    if (targetSubPath) {
      dir = dir + targetSubPath + "/";
    }
    try {
      let targetFilePath = dir + rawfileName;
      context.resourceManager.getRawFileContent(rawfileName, (error, model_buffer) => {
        if (error) {
          console.log(
            `[rawfile_copy_to_sandbox] ${rawfileName} is
            copy failed:${error.code}, message: ${error.message}.`);
        } else {
          let file = fs.openSync(targetFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, model_buffer.buffer);
          fs.closeSync(file);
          console.log(`[rawfile_copy_to_sandbox] ${rawfileName} is copy success`);
        }
      });
    } catch (error) {
      console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
    }
  }

  static copyRawfileToFilesDirAsync(
    rawfilePath: string,
    targetFilePath: string,
    context: Context
  ): Promise<void> {
    return new Promise((resolve, reject) => {
      try {
        context.resourceManager.getRawFileContent(rawfilePath, (error, model_buffer) => {
          if (error) {
            Log.error(`[rawfile_copy_async] ${rawfilePath} copy failed: ${error.code}, ${error.message}`);
            reject(error);
          } else {
            try {
              let file = fs.openSync(targetFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
              fs.writeSync(file.fd, model_buffer.buffer);
              fs.closeSync(file);
              Log.info(`[rawfile_copy_async] ${rawfilePath} -> ${targetFilePath} success`);
              resolve();
            } catch (writeError) {
              Log.error(`[rawfile_copy_async] Write failed: ${writeError}`);
              reject(writeError);
            }
          }
        });
      } catch (error) {
        Log.error(`[rawfile_copy_async] Exception: ${error}`);
        reject(error);
      }
    });
  }

  static fileCheckSync(fileName: string, context: Context): boolean {
    let targetFilePath = context.filesDir + "/" + fileName;
    try {
      return fs.accessSync(targetFilePath);
    } catch (err) {
      console.info(`${fileName} file does not exists! access failed with error message: ${err.message} , error code:${err.code}`);
      return false;
    }
  }
}


export class Log {
  static error(msg: string, tag: string = DEFAULT_TAG) {
    hilog.error(0x0001, tag, msg);
  }

  static info(msg: string, tag: string = DEFAULT_TAG) {
    hilog.info(0x0001, tag, msg);
  }

  static debug(msg: string, tag: string = DEFAULT_TAG) {
    hilog.debug(0x0001, tag, msg);
  }
}
