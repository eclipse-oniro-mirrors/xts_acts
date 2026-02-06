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

export enum ErrorCode {
  /**
   * Parameter error.
   */
  PARAM_ERROR_CODE = 401,

  /**
   * Permission denied.
   */
  PERM_DENIED_ERROR_CODE = 13900012,

  /**
   * Invalid argument.
   */
  ARGUMENT_INVALID_ERROR_CODE = 13900020,

  /**
   * System inner fail.
   */
  SYSTEM_INNER_ERROR_CODE = 14000011,

  /**
   * IPC error.
   */
  IPC_ERROR = 62980097,
  /*
   * Cropping exceptions.
   * */

  Cropping_Exceptions = 62980109,
  /*
   * The operation failed.
   * */
  Operation_Failed = 62980096,
  /*
  * Invalid image parameter
  * */
  Invalid_Image_Parameter = 62980115,
  /*
  *  Image initialization abnormal.
  * */
  Image_Initialization_Abnormal = 62980104,

  /*
   * Unsupported metadata. Possible causes: Unsupported metadata type.
   * */
  Unsupported_Metadata = 7600202,

  /*
   *  Invalid MIME type for the image source.
   * */
  Invalid_Image_Source = 62980149,

  /*
   *  Invalid media operation.
   * */
  Invalid_Media_operation = 62980137,
  /*
    * Failed to create the PixelMap.
    * */
  Failed_To_Create_PixelMap = 62980178,
  /*
    * Unsupported metadata. Possible causes: Unsupported metadata type.
    * */
  UNSUPPORTED_METADATA = 7600201,

}