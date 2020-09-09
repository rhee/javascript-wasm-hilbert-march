(module
  (type (;0;) (func))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i32 f64 f64 f64 i32) (result i32)))
  (type (;3;) (func (param i32 f64 i32 i32 i32) (result i32)))
  (func (;0;) (type 0)
    nop)
  (func (;1;) (type 1) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const 4
    local.set 1
    i32.const 4
    i32.const 1
    local.get 0
    i32.const 1
    i32.add
    local.tee 0
    i32.const 1
    i32.and
    select
    local.set 2
    local.get 0
    i32.const 1
    i32.shr_s
    local.tee 0
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.get 1
        i32.mul
        local.tee 1
        i32.const 1
        local.get 0
        i32.const 1
        i32.and
        select
        local.get 2
        i32.mul
        local.set 2
        local.get 0
        i32.const 1
        i32.shr_s
        local.tee 3
        local.set 0
        local.get 3
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func (;2;) (type 2) (param i32 i32 f64 f64 f64 i32) (result i32)
    (local i32 i32 i32 i32 i32 f64)
    loop  ;; label = @1
      local.get 1
      if  ;; label = @2
        i32.const 2
        i32.const 1
        local.get 1
        i32.const 1
        i32.add
        local.tee 7
        i32.const 1
        i32.and
        select
        local.set 6
        local.get 7
        i32.const 1
        i32.shr_s
        local.tee 7
        if  ;; label = @3
          i32.const 2
          local.set 8
          loop  ;; label = @4
            local.get 8
            local.get 8
            i32.mul
            local.tee 8
            i32.const 1
            local.get 7
            i32.const 1
            i32.and
            select
            local.get 6
            i32.mul
            local.set 6
            local.get 7
            i32.const 1
            i32.shr_s
            local.tee 10
            local.set 7
            local.get 10
            br_if 0 (;@4;)
          end
        end
        local.get 9
        local.get 0
        local.get 0
        local.get 0
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 2
        local.get 2
        local.get 6
        i32.const -1
        i32.add
        f64.convert_i32_s
        f64.div
        local.tee 11
        f64.sub
        f64.const 0x1p-1 (;=0.5;)
        f64.mul
        local.tee 2
        local.get 11
        local.get 2
        f64.add
        local.tee 11
        local.get 5
        i32.const 48
        i32.mul
        local.tee 5
        i32.const 1024
        i32.add
        i32.load
        f64.convert_i32_s
        f64.mul
        local.get 3
        f64.add
        local.get 11
        local.get 5
        i32.const 1028
        i32.add
        i32.load
        f64.convert_i32_s
        f64.mul
        local.get 4
        f64.add
        local.get 5
        i32.const 1032
        i32.add
        i32.load
        call 2
        local.tee 6
        i32.const 4
        i32.shl
        i32.add
        local.get 1
        local.get 2
        local.get 11
        local.get 5
        i32.const 1036
        i32.add
        i32.load
        f64.convert_i32_s
        f64.mul
        local.get 3
        f64.add
        local.get 11
        local.get 5
        i32.const 1040
        i32.add
        i32.load
        f64.convert_i32_s
        f64.mul
        local.get 4
        f64.add
        local.get 5
        i32.const 1044
        i32.add
        i32.load
        call 2
        local.get 6
        i32.add
        local.tee 6
        i32.const 4
        i32.shl
        i32.add
        local.get 1
        local.get 2
        local.get 11
        local.get 5
        i32.const 1048
        i32.add
        i32.load
        f64.convert_i32_s
        f64.mul
        local.get 3
        f64.add
        local.get 11
        local.get 5
        i32.const 1052
        i32.add
        i32.load
        f64.convert_i32_s
        f64.mul
        local.get 4
        f64.add
        local.get 5
        i32.const 1056
        i32.add
        i32.load
        call 2
        local.get 6
        i32.add
        local.tee 6
        i32.add
        local.set 9
        local.get 0
        local.get 6
        i32.const 4
        i32.shl
        i32.add
        local.set 0
        local.get 11
        local.get 5
        i32.const 1064
        i32.add
        i32.load
        f64.convert_i32_s
        f64.mul
        local.get 4
        f64.add
        local.set 4
        local.get 11
        local.get 5
        i32.const 1060
        i32.add
        i32.load
        f64.convert_i32_s
        f64.mul
        local.get 3
        f64.add
        local.set 3
        local.get 5
        i32.const 1068
        i32.add
        i32.load
        local.set 5
        br 1 (;@1;)
      end
    end
    local.get 0
    local.get 2
    local.get 5
    i32.const 48
    i32.mul
    local.tee 1
    i32.const 1064
    i32.add
    i32.load
    f64.convert_i32_s
    f64.mul
    local.get 4
    f64.add
    f64.store offset=56
    local.get 0
    local.get 2
    local.get 1
    i32.const 1060
    i32.add
    i32.load
    f64.convert_i32_s
    f64.mul
    local.get 3
    f64.add
    f64.store offset=48
    local.get 0
    local.get 2
    local.get 1
    i32.const 1052
    i32.add
    i32.load
    f64.convert_i32_s
    f64.mul
    local.get 4
    f64.add
    f64.store offset=40
    local.get 0
    local.get 2
    local.get 1
    i32.const 1048
    i32.add
    i32.load
    f64.convert_i32_s
    f64.mul
    local.get 3
    f64.add
    f64.store offset=32
    local.get 0
    local.get 2
    local.get 1
    i32.const 1040
    i32.add
    i32.load
    f64.convert_i32_s
    f64.mul
    local.get 4
    f64.add
    f64.store offset=24
    local.get 0
    local.get 2
    local.get 1
    i32.const 1036
    i32.add
    i32.load
    f64.convert_i32_s
    f64.mul
    local.get 3
    f64.add
    f64.store offset=16
    local.get 0
    local.get 2
    local.get 1
    i32.const 1028
    i32.add
    i32.load
    f64.convert_i32_s
    f64.mul
    local.get 4
    f64.add
    f64.store offset=8
    local.get 0
    local.get 2
    local.get 1
    i32.const 1024
    i32.add
    i32.load
    f64.convert_i32_s
    f64.mul
    local.get 3
    f64.add
    f64.store
    local.get 9
    i32.const 4
    i32.add)
  (func (;3;) (type 3) (param i32 f64 i32 i32 i32) (result i32)
    (local i32 i32 i32 f64 f64)
    local.get 3
    f64.load
    local.tee 8
    local.get 1
    f64.gt
    i32.const 1
    i32.xor
    i32.eqz
    if  ;; label = @1
      local.get 0
      local.get 4
      i64.load
      i64.store
      local.get 0
      local.get 4
      i64.load offset=8
      i64.store offset=8
      i32.const 0
      return
    end
    local.get 3
    local.get 2
    i32.const -1
    i32.add
    local.tee 5
    i32.const 3
    i32.shl
    i32.add
    f64.load
    local.get 1
    f64.lt
    i32.eqz
    if  ;; label = @1
      local.get 2
      i32.const 3
      i32.ge_s
      if  ;; label = @2
        local.get 5
        local.set 2
        loop  ;; label = @3
          local.get 2
          local.get 5
          i32.const 1
          i32.shr_u
          local.get 6
          i32.add
          local.tee 5
          local.get 3
          local.get 5
          i32.const 3
          i32.shl
          i32.add
          f64.load
          local.get 1
          f64.lt
          local.tee 7
          select
          local.tee 2
          local.get 5
          local.get 6
          local.get 7
          select
          local.tee 6
          i32.sub
          local.tee 5
          i32.const 1
          i32.gt_s
          br_if 0 (;@3;)
        end
        local.get 3
        local.get 6
        i32.const 3
        i32.shl
        i32.add
        f64.load
        local.set 8
      end
      local.get 0
      local.get 4
      local.get 6
      i32.const 4
      i32.shl
      local.tee 2
      i32.add
      f64.load
      local.tee 9
      local.get 1
      local.get 8
      f64.sub
      local.tee 1
      local.get 4
      local.get 6
      i32.const 1
      i32.add
      local.tee 5
      i32.const 4
      i32.shl
      local.tee 7
      i32.add
      f64.load
      local.get 9
      f64.sub
      f64.mul
      local.get 3
      local.get 5
      i32.const 3
      i32.shl
      i32.add
      f64.load
      local.get 8
      f64.sub
      local.tee 8
      f64.div
      f64.add
      f64.store
      local.get 0
      local.get 4
      local.get 2
      i32.const 8
      i32.or
      i32.add
      f64.load
      local.tee 9
      local.get 1
      local.get 4
      local.get 7
      i32.const 8
      i32.or
      i32.add
      f64.load
      local.get 9
      f64.sub
      f64.mul
      local.get 8
      f64.div
      f64.add
      f64.store offset=8
      local.get 6
      return
    end
    local.get 0
    local.get 4
    local.get 5
    i32.const 4
    i32.shl
    local.tee 2
    i32.add
    i64.load
    i64.store
    local.get 0
    local.get 4
    local.get 2
    i32.const 8
    i32.or
    i32.add
    i64.load
    i64.store offset=8
    local.get 5)
  (memory (;0;) 2)
  (global (;0;) i32 (i32.const 1024))
  (global (;1;) i32 (i32.const 1216))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 66752))
  (global (;4;) i32 (i32.const 0))
  (global (;5;) i32 (i32.const 1))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 0))
  (export "c_fractal_num_steps" (func 1))
  (export "c_fractal" (func 2))
  (export "c_interp" (func 3))
  (export "__dso_handle" (global 0))
  (export "__data_end" (global 1))
  (export "__global_base" (global 2))
  (export "__heap_base" (global 3))
  (export "__memory_base" (global 4))
  (export "__table_base" (global 5))
  (data (;0;) (i32.const 1028) "\01\00\00\00\03\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00\01")
  (data (;1;) (i32.const 1068) "\02\00\00\00\01\00\00\00\00\00\00\00\02")
  (data (;2;) (i32.const 1092) "\01\00\00\00\00\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\03\00\00\00\01\00\00\00\00\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00\00\00\00\00\01\00\00\00\02")
  (data (;3;) (i32.const 1172) "\01")
  (data (;4;) (i32.const 1188) "\03\00\00\00\01\00\00\00\00\00\00\00\03\00\00\00\01\00\00\00\01\00\00\00\01"))
