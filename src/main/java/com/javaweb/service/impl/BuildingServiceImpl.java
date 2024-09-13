package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssignment = new ArrayList<>();
        List<AssignmentBuildingEntity> staffOfBuilding = building.getAssignmentBuildingEntities();
        List<StaffResponseDTO> staffDTOs = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (AssignmentBuildingEntity item : staffOfBuilding) {
            staffAssignment.add(item.getStaffs());
        }
        for (UserEntity item : staffs) {
            StaffResponseDTO staffDTO = new StaffResponseDTO();
            staffDTO.setFullName(item.getFullName());
            staffDTO.setStaffId(item.getId());
            if(staffAssignment.contains(item)){
                staffDTO.setChecked("checked");
            }
            else{
                staffDTO.setChecked("");
            }
            staffDTOs.add(staffDTO);
        }
        responseDTO.setData(staffDTOs);
        responseDTO.setMessage("success");
        return responseDTO;

    }
}
