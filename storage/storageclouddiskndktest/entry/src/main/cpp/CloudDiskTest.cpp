/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include "filemanagement/clouddiskmanager/oh_cloud_disk_manager.h"
#include <iostream>
#include "native_common.h"
#include "hilog/log.h"
#include <malloc.h>
#include <js_native_api_types.h>
#include "common/logger_common.h"
#include "common/utils.h"

static uint64_t g_usn = 0;
static const size_t COUNT = 10;

static void call(const CloudDisk_SyncFolderPath syncFolderPath, const CloudDisk_ChangeData changeDatas[], size_t len)
{
    LOGI("OnChangeDataCallback start");
    for (int32_t i = 0; i < len; ++i) {
        auto data = changeDatas[i];
        auto operationType = data.operationType;
        auto path = data.relativePathInfo.value;
        auto length = data.relativePathInfo.length;
        g_usn = changeDatas[i].updateSequenceNumber;
    }
    LOGI("OnChangeDataCallback end");
}

static napi_value RegisterSyncFolder(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolder syncFolder;
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);
    syncFolder.path = pathInfo;
    syncFolder.state = CloudDisk_SyncFolderState::INACTIVE;

    CloudDisk_DisplayNameInfo displayNameInfo;
    char* newname = "Ntest";
    displayNameInfo.displayNameResId = 0;
    displayNameInfo.customAlias = newname;
    displayNameInfo.customAliasLength = strlen(displayNameInfo.customAlias);
    syncFolder.displayNameInfo = displayNameInfo;

    LOGW("OH_CloudDisk_RegisterSyncFolder start.path: %{public}s", path);
    auto ret = OH_CloudDisk_RegisterSyncFolder(&syncFolder);
    LOGW("OH_CloudDisk_RegisterSyncFolder ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value RegisterSyncFolder001(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolder syncFolder;
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);
    syncFolder.path = pathInfo;
    syncFolder.state = CloudDisk_SyncFolderState::ACTIVE;

    CloudDisk_DisplayNameInfo displayNameInfo;
    char* newname = "Ntest";
    displayNameInfo.displayNameResId = 1;
    displayNameInfo.customAlias = newname;
    displayNameInfo.customAliasLength = strlen(displayNameInfo.customAlias);
    syncFolder.displayNameInfo = displayNameInfo;

    LOGW("OH_CloudDisk_RegisterSyncFolder start.path: %{public}s", path);
    auto ret = OH_CloudDisk_RegisterSyncFolder(&syncFolder);
    LOGW("OH_CloudDisk_RegisterSyncFolder ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value UnregisterSyncFolder(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    LOGW("OH_CloudDisk_UnregisterSyncFolder start.path: %{public}s", path);
    auto ret = OH_CloudDisk_UnregisterSyncFolder(pathInfo);
    LOGW("OH_CloudDisk_UnregisterSyncFolder ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value ActiveSyncFolder(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    LOGW("OH_CloudDisk_ActiveSyncFolder start.path: %{public}s", path);
    auto ret = OH_CloudDisk_ActiveSyncFolder(pathInfo);
    LOGW("OH_CloudDisk_ActiveSyncFolder ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value DeactiveSyncFolder(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    LOGW("OH_CloudDisk_DeactiveSyncFolder start.path: %{public}s", path);
    auto ret = OH_CloudDisk_DeactiveSyncFolder(pathInfo);
    LOGW("OH_CloudDisk_DeactiveSyncFolder ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value GetSyncFolders(napi_env env, napi_callback_info info)
{
    CloudDisk_SyncFolder *syncFolders;
    size_t count = 0;
    LOGW("OH_CloudDisk_GetSyncFolders start");
    auto ret = OH_CloudDisk_GetSyncFolders(&syncFolders, &count);
    LOGW("OH_CloudDisk_GetSyncFolders ret: %{public}d", ret, count);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value UpdateCustomAlias(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);
    char* updateDisPlayName = "Newname";

    LOGW("OH_CloudDisk_UpdateCustomAlias start.path: %{public}s", path);
    auto ret = OH_CloudDisk_UpdateCustomAlias(pathInfo, updateDisPlayName, strlen(updateDisPlayName));
    LOGW("OH_CloudDisk_UpdateCustomAlias ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value ReFolderChanges(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    LOGW("OH_CloudDisk_RegisterSyncFolderChanges start.path: %{public}s", path);
    auto ret = OH_CloudDisk_RegisterSyncFolderChanges(pathInfo, &call);
    LOGW("OH_CloudDisk_RegisterSyncFolderChanges ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value UnReFolderChanges(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    LOGW("OH_CloudDisk_UnregisterSyncFolderChanges start.path: %{public}s", path);
    auto ret = OH_CloudDisk_UnregisterSyncFolderChanges(pathInfo);
    LOGW("OH_CloudDisk_UnregisterSyncFolderChanges ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value GetSyncFolderChanges(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);
    CloudDisk_ChangesResult* changesResult = nullptr;

    LOGW("OH_CloudDisk_GetSyncFolderChanges start.path: %{public}s", path);
    auto ret = OH_CloudDisk_GetSyncFolderChanges(pathInfo, g_usn, COUNT, &changesResult);
    LOGW("OH_CloudDisk_GetSyncFolderChanges ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value Tset_CloudDisk_ErrorCode_ENUM(napi_env env, napi_callback_info info)
{
    CloudDisk_ErrorCode errcode = CLOUD_DISK_OK;
    NAPI_ASSERT(env, errcode == 0, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_PERMISSION_DENIED;
    NAPI_ASSERT(env, errcode == 201, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_NOT_SUPPORTED;
    NAPI_ASSERT(env, errcode == 801, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_INVALID_ARG;
    NAPI_ASSERT(env, errcode == 34400001, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_SYNC_FOLDER_PATH_UNAUTHORIZED;
    NAPI_ASSERT(env, errcode == 34400002, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_IPC_FAILED;
    NAPI_ASSERT(env, errcode == 34400003, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_SYNC_FOLDER_LIMIT_EXCEEDED;
    NAPI_ASSERT(env, errcode == 34400004, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_CONFLICT_THIS_APP;
    NAPI_ASSERT(env, errcode == 34400005, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_CONFLICT_OTHER_APP;
    NAPI_ASSERT(env, errcode == 34400006, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_REGISTER_SYNC_FOLDER_FAILED;
    NAPI_ASSERT(env, errcode == 34400007, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED;
    NAPI_ASSERT(env, errcode == 34400008, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_UNREGISTER_SYNC_FOLDER_FAILED;
    NAPI_ASSERT(env, errcode == 34400009, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST;
    NAPI_ASSERT(env, errcode == 34400010, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_LISTENER_NOT_REGISTERED;
    NAPI_ASSERT(env, errcode == 34400011, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_LISTENER_ALREADY_REGISTERED;
    NAPI_ASSERT(env, errcode == 34400012, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_INVALID_CHANGE_SEQUENCE;
    NAPI_ASSERT(env, errcode == 34400013, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_TRY_AGAIN;
    NAPI_ASSERT(env, errcode == 34400014, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_NOT_ALLOWED;
    NAPI_ASSERT(env, errcode == 34400015, "PREFERENCES_OK is fail.");
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Tset_CloudDisk_OperationType_ENUM(napi_env env, napi_callback_info info)
{
    CloudDisk_OperationType OperationType = CREATE;
    NAPI_ASSERT(env, OperationType == 0, "PREFERENCES_OK is fail.");
    OperationType = DELETE;
    NAPI_ASSERT(env, OperationType == 1, "PREFERENCES_OK is fail.");
    OperationType = MOVE_FROM;
    NAPI_ASSERT(env, OperationType == 2, "PREFERENCES_OK is fail.");
    OperationType = MOVE_TO;
    NAPI_ASSERT(env, OperationType == 3, "PREFERENCES_OK is fail.");
    OperationType = CLOSE_WRITE;
    NAPI_ASSERT(env, OperationType == 4, "PREFERENCES_OK is fail.");
    OperationType = SYNC_FOLDER_INVALID;
    NAPI_ASSERT(env, OperationType == 5, "PREFERENCES_OK is fail.");
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Tset_CloudDisk_ErrorReason_ENUM(napi_env env, napi_callback_info info)
{
    CloudDisk_ErrorReason ErrorReason = INVALID_ARGUMENT;
    NAPI_ASSERT(env, ErrorReason == 0, "PREFERENCES_OK is fail.");
    ErrorReason = NO_SUCH_FILE;
    NAPI_ASSERT(env, ErrorReason == 1, "PREFERENCES_OK is fail.");
    ErrorReason = NO_SPACE_LEFT;
    NAPI_ASSERT(env, ErrorReason == 2, "PREFERENCES_OK is fail.");
    ErrorReason = OUT_OF_RANGE;
    NAPI_ASSERT(env, ErrorReason == 3, "PREFERENCES_OK is fail.");
    ErrorReason = NO_SYNC_STATE;
    NAPI_ASSERT(env, ErrorReason == 4, "PREFERENCES_OK is fail.");
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value SetFileSyncStates(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    char* path1 = "/storage/Users/currentUser/111.txt";
    char* path2 = "/storage/Users/currentUser/222.txt";
    char* path3 = "/storage/Users/currentUser/333.txt";
    char* path4 = "/storage/Users/currentUser/444.txt";
    char* path5 = "/storage/Users/currentUser/555.txt";
    char* path6 = "/storage/Users/currentUser/666.txt";
    CloudDisk_FileSyncState fileSyncStates[] = {
        {
            {
                .value = path1,
                .length = strlen(path1)
            },
            CloudDisk_SyncState::SYNC_SUCCEEDED
        },
        {
            {
                .value = path2,
                .length = strlen(path2)
            },
            CloudDisk_SyncState::SYNC_FAILED
        },
        {
            {
                .value = path3,
                .length = strlen(path3)
            },
            CloudDisk_SyncState::IDLE
        },
        {
            {
                .value = path4,
                .length = strlen(path4)
            },
            CloudDisk_SyncState::SYNCING
        },
        {
            {
                .value = path5,
                .length = strlen(path5)
            },
            CloudDisk_SyncState::SYNC_CANCELED
        },
        {
            {
                .value = path6,
                .length = strlen(path6)
            },
            CloudDisk_SyncState::SYNC_CONFLICTED
        }
    };
    CloudDisk_FailedList *failedLists;
    size_t failedCount;
    size_t bufferLength = sizeof(fileSyncStates) / sizeof(fileSyncStates[0]);

    LOGW("OH_CloudDisk_SetFileSyncStates start.path: %{public}s", path);
    auto ret = OH_CloudDisk_SetFileSyncStates(pathInfo, fileSyncStates, bufferLength, &failedLists, &failedCount);
    LOGW("OH_CloudDisk_SetFileSyncStates ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value GetFileSyncStates(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    char* path1 = "/storage/Users/currentUser/111.txt";
    char* path2 = "/storage/Users/currentUser/222.txt";
    CloudDisk_PathInfo paths[] = {
        {
            .value = path1,
            .length = strlen(path1)
        },
        {
            .value = path2,
            .length = strlen(path2)
        }
    };
    CloudDisk_ResultList *resultLists;
    size_t resultCount;

    LOGW("OH_CloudDisk_GetFileSyncStates start.path: %{public}s", path);
    auto ret = OH_CloudDisk_GetFileSyncStates(pathInfo, paths, sizeof(paths) / sizeof(paths[0]),
    &resultLists, &resultCount);
    LOGW("OH_CloudDisk_GetFileSyncStates ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "RegisterSyncFolder", nullptr, RegisterSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterSyncFolder001", nullptr, RegisterSyncFolder001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UnregisterSyncFolder", nullptr, UnregisterSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ActiveSyncFolder", nullptr, ActiveSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DeactiveSyncFolder", nullptr, DeactiveSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetSyncFolders", nullptr, GetSyncFolders, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdateCustomAlias", nullptr, UpdateCustomAlias, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ReFolderChanges", nullptr, ReFolderChanges, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UnReFolderChanges", nullptr, UnReFolderChanges, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetSyncFolderChanges", nullptr, GetSyncFolderChanges, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetFileSyncStates", nullptr, SetFileSyncStates, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetFileSyncStates", nullptr, GetFileSyncStates, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Tset_CloudDisk_ErrorCode_ENUM", nullptr, Tset_CloudDisk_ErrorCode_ENUM, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Tset_CloudDisk_OperationType_ENUM", nullptr, Tset_CloudDisk_OperationType_ENUM, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Tset_CloudDisk_ErrorReason_ENUM", nullptr, Tset_CloudDisk_ErrorReason_ENUM, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "clouddisk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}