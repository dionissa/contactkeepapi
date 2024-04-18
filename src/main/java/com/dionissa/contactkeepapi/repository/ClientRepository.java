package com.dionissa.contactkeepapi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.dionissa.contactkeepapi.model.Client;

public interface ClientRepository extends JpaRepository<Client, Long> {
    List<Client> findByName(String name);

    List<Client> findByNameContainingIgnoreCaseAndPhoneNumberContainingIgnoreCaseAndNotesContainingIgnoreCase(
            String name, String phoneNumber, String notes);
}
