/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../ImageBaseFunc.h"
#include "../ActsImage0017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsImage0017TS, TCAdd1dNotransferNormalread, "dEQP-VK.image.atomic_operations.add.1d.notransfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAdd2dNotransferSparseread, "dEQP-VK.image.atomic_operations.add.2d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAdd2dTransferNormalread, "dEQP-VK.image.atomic_operations.add.2d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAdd2darrayNotransferSparseread, "dEQP-VK.image.atomic_operations.add.2d_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAdd2darrayTransferNormalread, "dEQP-VK.image.atomic_operations.add.2d_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAdd3dNotransferSparseread, "dEQP-VK.image.atomic_operations.add.3d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAdd3dTransferNormalread, "dEQP-VK.image.atomic_operations.add.3d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAddCubeNotransferSparseread, "dEQP-VK.image.atomic_operations.add.cube.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAddCubeTransferNormalread, "dEQP-VK.image.atomic_operations.add.cube.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAddCubearrayNotransferSparseread, "dEQP-VK.image.atomic_operations.add.cube_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAddCubearrayTransferNormalread, "dEQP-VK.image.atomic_operations.add.cube_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCSub2dNotransferSparseread, "dEQP-VK.image.atomic_operations.sub.2d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCSub2dTransferNormalread, "dEQP-VK.image.atomic_operations.sub.2d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCSub2darrayNotransferSparseread, "dEQP-VK.image.atomic_operations.sub.2d_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCSub2darrayTransferNormalread, "dEQP-VK.image.atomic_operations.sub.2d_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCSub3dNotransferSparseread, "dEQP-VK.image.atomic_operations.sub.3d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCSub3dTransferNormalread, "dEQP-VK.image.atomic_operations.sub.3d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCSubCubeNotransferSparseread, "dEQP-VK.image.atomic_operations.sub.cube.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCSubCubeTransferNormalread, "dEQP-VK.image.atomic_operations.sub.cube.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCSubCubearrayNotransferSparseread, "dEQP-VK.image.atomic_operations.sub.cube_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCSubCubearrayTransferNormalread, "dEQP-VK.image.atomic_operations.sub.cube_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCInc2dNotransferSparseread, "dEQP-VK.image.atomic_operations.inc.2d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCInc2dTransferNormalread, "dEQP-VK.image.atomic_operations.inc.2d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCInc2darrayNotransferSparseread, "dEQP-VK.image.atomic_operations.inc.2d_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCInc2darrayTransferNormalread, "dEQP-VK.image.atomic_operations.inc.2d_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCInc3dNotransferSparseread, "dEQP-VK.image.atomic_operations.inc.3d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCInc3dTransferNormalread, "dEQP-VK.image.atomic_operations.inc.3d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCIncCubeNotransferSparseread, "dEQP-VK.image.atomic_operations.inc.cube.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCIncCubeTransferNormalread, "dEQP-VK.image.atomic_operations.inc.cube.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCIncCubearrayNotransferSparseread, "dEQP-VK.image.atomic_operations.inc.cube_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCIncCubearrayTransferNormalread, "dEQP-VK.image.atomic_operations.inc.cube_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCDec2dNotransferSparseread, "dEQP-VK.image.atomic_operations.dec.2d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCDec2dTransferNormalread, "dEQP-VK.image.atomic_operations.dec.2d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCDec2darrayNotransferSparseread, "dEQP-VK.image.atomic_operations.dec.2d_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCDec2darrayTransferNormalread, "dEQP-VK.image.atomic_operations.dec.2d_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCDec3dNotransferSparseread, "dEQP-VK.image.atomic_operations.dec.3d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCDec3dTransferNormalread, "dEQP-VK.image.atomic_operations.dec.3d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCDecCubeNotransferSparseread, "dEQP-VK.image.atomic_operations.dec.cube.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCDecCubeTransferNormalread, "dEQP-VK.image.atomic_operations.dec.cube.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCDecCubearrayNotransferSparseread, "dEQP-VK.image.atomic_operations.dec.cube_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCDecCubearrayTransferNormalread, "dEQP-VK.image.atomic_operations.dec.cube_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMin2dNotransferSparseread, "dEQP-VK.image.atomic_operations.min.2d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMin2dTransferNormalread, "dEQP-VK.image.atomic_operations.min.2d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMin2darrayNotransferSparseread, "dEQP-VK.image.atomic_operations.min.2d_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMin2darrayTransferNormalread, "dEQP-VK.image.atomic_operations.min.2d_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMin3dNotransferSparseread, "dEQP-VK.image.atomic_operations.min.3d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMin3dTransferNormalread, "dEQP-VK.image.atomic_operations.min.3d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMinCubeNotransferSparseread, "dEQP-VK.image.atomic_operations.min.cube.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMinCubeTransferNormalread, "dEQP-VK.image.atomic_operations.min.cube.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMinCubearrayNotransferSparseread, "dEQP-VK.image.atomic_operations.min.cube_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMinCubearrayTransferNormalread, "dEQP-VK.image.atomic_operations.min.cube_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMax2dNotransferSparseread, "dEQP-VK.image.atomic_operations.max.2d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMax2dTransferNormalread, "dEQP-VK.image.atomic_operations.max.2d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMax2darrayNotransferSparseread, "dEQP-VK.image.atomic_operations.max.2d_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMax2darrayTransferNormalread, "dEQP-VK.image.atomic_operations.max.2d_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMax3dNotransferSparseread, "dEQP-VK.image.atomic_operations.max.3d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMax3dTransferNormalread, "dEQP-VK.image.atomic_operations.max.3d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMaxCubeNotransferSparseread, "dEQP-VK.image.atomic_operations.max.cube.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMaxCubeTransferNormalread, "dEQP-VK.image.atomic_operations.max.cube.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMaxCubearrayNotransferSparseread, "dEQP-VK.image.atomic_operations.max.cube_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCMaxCubearrayTransferNormalread, "dEQP-VK.image.atomic_operations.max.cube_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAnd2dNotransferSparseread, "dEQP-VK.image.atomic_operations.and.2d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAnd2dTransferNormalread, "dEQP-VK.image.atomic_operations.and.2d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAnd2darrayNotransferSparseread, "dEQP-VK.image.atomic_operations.and.2d_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAnd2darrayTransferNormalread, "dEQP-VK.image.atomic_operations.and.2d_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAnd3dNotransferSparseread, "dEQP-VK.image.atomic_operations.and.3d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAnd3dTransferNormalread, "dEQP-VK.image.atomic_operations.and.3d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAndCubeNotransferSparseread, "dEQP-VK.image.atomic_operations.and.cube.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAndCubeTransferNormalread, "dEQP-VK.image.atomic_operations.and.cube.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAndCubearrayNotransferSparseread, "dEQP-VK.image.atomic_operations.and.cube_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCAndCubearrayTransferNormalread, "dEQP-VK.image.atomic_operations.and.cube_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCOr2dNotransferSparseread, "dEQP-VK.image.atomic_operations.or.2d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCOr2dTransferNormalread, "dEQP-VK.image.atomic_operations.or.2d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCOr2darrayNotransferSparseread, "dEQP-VK.image.atomic_operations.or.2d_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCOr2darrayTransferNormalread, "dEQP-VK.image.atomic_operations.or.2d_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCOr3dNotransferSparseread, "dEQP-VK.image.atomic_operations.or.3d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCOr3dTransferNormalread, "dEQP-VK.image.atomic_operations.or.3d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCOrCubeNotransferSparseread, "dEQP-VK.image.atomic_operations.or.cube.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCOrCubeTransferNormalread, "dEQP-VK.image.atomic_operations.or.cube.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCOrCubearrayNotransferSparseread, "dEQP-VK.image.atomic_operations.or.cube_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCOrCubearrayTransferNormalread, "dEQP-VK.image.atomic_operations.or.cube_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCXor2dNotransferSparseread, "dEQP-VK.image.atomic_operations.xor.2d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCXor2dTransferNormalread, "dEQP-VK.image.atomic_operations.xor.2d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCXor2darrayNotransferSparseread, "dEQP-VK.image.atomic_operations.xor.2d_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCXor2darrayTransferNormalread, "dEQP-VK.image.atomic_operations.xor.2d_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCXor3dNotransferSparseread, "dEQP-VK.image.atomic_operations.xor.3d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCXor3dTransferNormalread, "dEQP-VK.image.atomic_operations.xor.3d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCXorCubeNotransferSparseread, "dEQP-VK.image.atomic_operations.xor.cube.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCXorCubeTransferNormalread, "dEQP-VK.image.atomic_operations.xor.cube.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCXorCubearrayNotransferSparseread, "dEQP-VK.image.atomic_operations.xor.cube_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCXorCubearrayTransferNormalread, "dEQP-VK.image.atomic_operations.xor.cube_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCExchange2dNotransferSparseread, "dEQP-VK.image.atomic_operations.exchange.2d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCExchange2dTransferNormalread, "dEQP-VK.image.atomic_operations.exchange.2d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCExchange2darrayNotransferSparseread, "dEQP-VK.image.atomic_operations.exchange.2d_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCExchange2darrayTransferNormalread, "dEQP-VK.image.atomic_operations.exchange.2d_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCExchange3dNotransferSparseread, "dEQP-VK.image.atomic_operations.exchange.3d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCExchange3dTransferNormalread, "dEQP-VK.image.atomic_operations.exchange.3d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCExchangeCubeNotransferSparseread, "dEQP-VK.image.atomic_operations.exchange.cube.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCExchangeCubeTransferNormalread, "dEQP-VK.image.atomic_operations.exchange.cube.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCExchangeCubearrayNotransferSparseread, "dEQP-VK.image.atomic_operations.exchange.cube_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCExchangeCubearrayTransferNormalread, "dEQP-VK.image.atomic_operations.exchange.cube_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCompareexchange2dNotransferSparseread, "dEQP-VK.image.atomic_operations.compare_exchange.2d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCompareexchange2dTransferNormalread, "dEQP-VK.image.atomic_operations.compare_exchange.2d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCompareexchange2darrayNotransferSparseread, "dEQP-VK.image.atomic_operations.compare_exchange.2d_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCompareexchange2darrayTransferNormalread, "dEQP-VK.image.atomic_operations.compare_exchange.2d_array.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCompareexchange3dNotransferSparseread, "dEQP-VK.image.atomic_operations.compare_exchange.3d.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCompareexchange3dTransferNormalread, "dEQP-VK.image.atomic_operations.compare_exchange.3d.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCompareexchangeCubeNotransferSparseread, "dEQP-VK.image.atomic_operations.compare_exchange.cube.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCompareexchangeCubeTransferNormalread, "dEQP-VK.image.atomic_operations.compare_exchange.cube.transfer.normal_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCompareexchangeCubearrayNotransferSparseread, "dEQP-VK.image.atomic_operations.compare_exchange.cube_array.notransfer.sparse_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCompareexchangeCubearrayTransferNormalread, "dEQP-VK.image.atomic_operations.compare_exchange.cube_array.transfer.normal_read*");