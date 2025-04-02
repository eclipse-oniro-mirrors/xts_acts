/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#ifndef FILEMANAGEMENT_APP_FILE_SERVICE_INTERFACES_FILE_SHARE_ERROR_CODE_H
#define FILEMANAGEMENT_APP_FILE_SERVICE_INTERFACES_FILE_SHARE_ERROR_CODE_H

enum FileManagement_ErrCode {
    E_NO_ERROR = 0,
    E_PERMISSION = 201,
    E_PARAMS = 401,
    E_DEVICE_NOT_SUPPORT = 801,
    E_EPERM = 13900001,
    E_ENOMEM = 13900011,
    E_UNKNOWN_ERROR = 13900042
};

#endif // FILEMANAGEMENT_APP_FILE_SERVICE_INTERFACES_FILE_SHARE_ERROR_CODE_H