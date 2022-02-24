package com.yaroslavgiv.cubafood.setings;
// класс настроек
import android.os.Bundle;
import android.preference.PreferenceFragment;

import androidx.annotation.Nullable;

import com.yaroslavgiv.cubafood.R;

public class SettringsFragment extends PreferenceFragment{
    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.preferens_screen);
    }
}
