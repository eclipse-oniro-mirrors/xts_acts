#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (c) 2024 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import json
import os
import sys
import stat

precise_repo_xts = sys.argv[1]
DEEP = int(sys.argv[2]) if len(sys.argv) > 2 else -1
home = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
manifest_home = os.path.join(home, ".repo")
preloader_path = os.path.join(home, "out", "preloader")
PRECISE_GNI_NAME = "precise_run.gni"
DEPENDS_TREE_NAME = "depends_tree.txt"
F_DEPENDS_NAME = "f_depends.txt"
MAX_PRECISE_PR_NUM = 20

# 首层依赖关系dist
dependency_dist = {}
# 全量编译白名单
whitelist = {"test/xts/acts", "build"}


def get_f_dependes_dist(path):
    count = 0
    # 遍历目录下的所有文件和子目录
    for root, dirs, files in os.walk(path):
        for file in files:
            if file == 'bundle.json':
                count = count + 1
                # 构建完整的文件路径
                file_path = os.path.join(root, file)
                # 读取 JSON 文件并转换为 Python 对象
                with open(file_path, 'r', encoding='utf-8') as f:
                    json_data = json.load(f)
                    bundle_name = json_data['name'].split('/')[-1]
                    if "deps" not in json_data['component']:
                        continue
                    deps = json_data['component']['deps']
                    # 依赖关系额写入dependency_dist
                    if bundle_name not in dependency_dist:
                        dependency_dist[bundle_name] = []
                    if "components" in deps:
                        components_defs = deps['components']
                        for c_def in components_defs:
                            if c_def in dependency_dist:
                                dependency_dist[c_def].append(bundle_name)
                            else:
                                dependency_dist[c_def] = [bundle_name]
                    if "third_party" in deps:
                        third_party_defs = deps['third_party']
                        for t_def in third_party_defs:
                            if t_def in dependency_dist:
                                dependency_dist[t_def].append(bundle_name)
                            else:
                                dependency_dist[t_def] = [bundle_name]
    print(count)


def getbundname(path_list):
    print(path_list)
    bundle_list = []
    for path in path_list:
        # 读取JSON文件并获取指定key的value
        with open(os.path.join(home, path, "bundle.json"), 'r') as file:
            data = json.load(file)
        bundle_list.append(data['component']['name'])
    return bundle_list


def get_all_dependencies(nodes, dependencies):
    visited = set()  # 存储已访问的节点
    string_buffer = []

    def dfs(node, num, string_buffer):
        string_buffer.append("  " * num + node)  # 追加内容到列表
        if node in visited:
            return
        if DEEP != -1 and num > DEEP:
            return
        visited.add(node)
        if node in dependencies:
            for dependency in dependencies[node]:
                dfs(dependency, num + 1, string_buffer)  # 传递可变对象进行修改

    for node in nodes:
        dfs(node, 0, string_buffer)

    return visited, string_buffer


def write_precise_gni(depends_list, file_name):
    # 将数组转换为字符串形式，例如使用逗号分隔
    array_str = json.dumps(list(depends_list))

    # 打开文件并写入数组字符串
    file_descriptor = os.open(file_name, os.O_WRONLY | os.O_CREAT | os.O_TRUNC, stat.S_IRUSR | stat.S_IWUSR | stat.S_IRGRP)
    with os.fdopen(file_descriptor, 'w') as file:
        file.write("precise_run=")
        file.write(array_str)


def write_file(depends_list, file_name):
    file_descriptor = os.open(file_name, os.O_WRONLY | os.O_CREAT | os.O_TRUNC, stat.S_IRUSR | stat.S_IWUSR | stat.S_IRGRP)
    with os.fdopen(file_descriptor, 'w') as f:
        json.dump(depends_list, f, indent=4)


def run(precise_repo_xts_list):
    # pr数>MAX或在白名单中的
    if len(precise_repo_xts_list) >= MAX_PRECISE_PR_NUM or any(item in precise_repo_xts_list for item in whitelist):
        depends_tree = "all"
        depends_list = {"all"}
    else:
        try:
            # 获取bundle_name_list
            bundlelist = getbundname(precise_repo_xts_list)
            # 计算首层依赖map
            get_f_dependes_dist(home)
            print(bundlelist)
            # 获取全部需要跑的bundlename
            depends_list, depends_tree = get_all_dependencies(bundlelist, dependency_dist)
            depends_list.add("acts")
            print(depends_list)
        except Exception as e:
            print("发生异常:", str(e))
            depends_tree = "all"
            depends_list = {"all"}
    # 依赖树输出
    write_file(depends_tree, os.path.join(preloader_path, DEPENDS_TREE_NAME))
    # 写入gni文件
    write_precise_gni(depends_list, os.path.join(preloader_path, PRECISE_GNI_NAME))


if __name__ == '__main__':
    print("counting dependencies start")
    run(precise_repo_xts.split(','))
    print("counting dependencies finished")