import os

from hypium.advance.perf.perf_basecase import PerfBaseCase
from PermissionPreset.permission_preset import PermissionPreset


class Permission_Preset(PerfBaseCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        self.tests = [
            "test_step"
        ]
        self.case_id = os.path.splitext(os.path.basename(__file__))[0]
        PerfBaseCase.__init__(self, controllers)
        self.log.info("Case id is %s" % self.case_id)

    def setup(self):
        self.log.info("预置工作:初始化手机开始................." + self.devices[0].device_sn)

    def test_step(self):
        # 生成原子化用例, 使用原子化用例构建步骤
        steps = [
            PermissionPreset(self.driver, self.case_id)
        ]
        # 执行
        self.run_perf_models(steps, fail_break=False)

    def teardown(self):
        result = self.get_case_result()
        self.log.info("收尾工作................., result is {}".format(result))
